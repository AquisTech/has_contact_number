# frozen_string_literal: true
module ActionView::Helpers::FormOptionsHelper

  puts '------------------------------------HasContactNumber::HelperMethods---------------------'
  def options_for_isd_code_select
    @isd_code_options ||= IsoCountryCodes.all.map do |record|

      [record.calling_code, record.calling_code.delete('+').rjust(4, '0')]

    end
  end

end
