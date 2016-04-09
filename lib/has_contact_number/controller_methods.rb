# frozen_string_literal: true
module HasContactNumber::ControllerMethods

  def contact_number_attributes(*attrs)
    attrs.flat_map { |attr| [:"#{attr}_isd_code", :"#{attr}_without_isd_code"] }
  end

end
ActionController::Base.send(:include, HasContactNumber::ControllerMethods)
