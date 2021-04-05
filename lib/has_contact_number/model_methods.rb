# frozen_string_literal: true
module HasContactNumber::ModelMethods

  extend ActiveSupport::Concern
  module ClassMethods

    def contact_number_attributes(*columns)
      columns.each do |column|

        define_methods_for(column)

      end
    end

    def define_methods_for(column)
      class_eval <<-METHODS
        attr_accessor :#{column}_isd_code, :#{column}_without_isd_code

        def #{column}_isd_code
          @#{column}_isd_code ||= #{column} && #{column}[0..3]
        end

        def #{column}_without_isd_code
          @#{column}_without_isd_code ||= #{column} && #{column}[4..-1]
        end

        before_validation { |model|
          model.#{column} = model.#{column}_isd_code + model.#{column}_without_isd_code
        }

        validates :#{column}_isd_code, presence: true, if: proc { |model| model.#{column}_without_isd_code.present? }
        validates :#{column}_without_isd_code, presence: true, if: proc { |model| model.#{column}_isd_code.present? }
        validates :#{column}, phony_plausible: true, if: proc { |model|
          model.#{column}_isd_code.present? && model.#{column}_without_isd_code.present?
        }
      METHODS
    end

  end

end
ActiveRecord::Base.send(:include, HasContactNumber::ModelMethods)
