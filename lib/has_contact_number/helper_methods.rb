# frozen_string_literal: true
module ActionView::Helpers::FormOptionsHelper

  OPTIONS_FOR_ISD_CODES_SELECT = IsoCountryCodes.all.map{ |icc|
    {
      code: icc.calling_code,
      code_to_i: icc.calling_code.delete('+').to_i,
      code_to_db: icc.calling_code.delete('+').rjust(4, '0'),
      country: icc.name,
      country_with_code: "#{icc.name} (#{icc.calling_code})"
    }
  }
  OPTIONS_FOR_ISD_CODES_SELECT_BY_CODE = OPTIONS_FOR_ISD_CODES_SELECT.uniq.sort_by{|record| record[:code_to_i]}.map do |record|
    [record[:code], record[:code_to_db]]
  end
  OPTIONS_FOR_ISD_CODES_SELECT_BY_COUNTRY_NAME = OPTIONS_FOR_ISD_CODES_SELECT.sort_by{|record| record[:country]}.map do |record|
    [record[:country_with_code], record[:code_to_db]]
  end

  def options_for_isd_code_select(display_country_names: true)
    display_country_names ? OPTIONS_FOR_ISD_CODES_SELECT_BY_COUNTRY_NAME : OPTIONS_FOR_ISD_CODES_SELECT_BY_CODE
  end

end
