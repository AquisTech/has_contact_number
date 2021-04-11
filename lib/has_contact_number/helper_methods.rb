# frozen_string_literal: true
module ActionView::Helpers::FormOptionsHelper

  OPTIONS_FOR_ISD_CODES_SELECT = IsoCountryCodes.all.map{ |icc|
    {
      code: icc.calling_code,
      code_to_db: icc.calling_code.delete('+').rjust(4, '0')
    }
  }
  OPTIONS_FOR_ISD_CODES_SELECT_BY_CODE = OPTIONS_FOR_ISD_CODES_SELECT.uniq.map do |record|
    [record[:code], record[:code_to_db]]
  end

  def options_for_isd_code_select
    OPTIONS_FOR_ISD_CODES_SELECT_BY_CODE
  end

end
