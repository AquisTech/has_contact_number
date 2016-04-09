# HasContactNumber

Provides support for validating, storing and retrieving phone, mobile, fax numbers with ISD code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'has_contact_number'
```

And then execute:

```shell
    $ bundle
```

## Usage

### Prerequisites

Add columns for required contact_number attributes in table.

### In Model

Define contact number attributes/columns in model where you have columns like phone_number, mobile_number, fax_number, etc.

```ruby
contact_number_attributes :column1, :column2, :columnN
```
For example:
```ruby
class Contact < ActiveRecord::Base

  contact_number_attributes :phone_number, :mobile_number, :fax_number

end
```
### In Controller

Use method contact_number_attributes to generate list of attributes to be permitted.

For example:
```ruby
class ContactsController < ApplicationController

  def contact_params
    params.require(:contact).permit(
      *contact_number_attributes(:phone_number, :mobile_number, :fax_number), # Other attributes
    )
  end

end
```
Note: Pay attention to usage of splat operator (`*`) prefixed to contact_number_attributes

### In View

You can add select list for ISD code of contact_number attribute using collection options_for_isd_code_select and text field for contact_number attribute.

For example:
If you have phone_number attribute then following should be your view code (For HAML)
```haml
= f.select :phone_number_isd_code, options_for_isd_code_select, prompt: 'Select'
= f.text_field :phone_number_without_isd_code, placeholder: 'Phone Number'
```

You can use any FormBuilder like SimpleForm as

```haml
= f.input :phone_number_isd_code, collection: options_for_isd_code_select, prompt: 'Select'
= f.input :phone_number_without_isd_code, placeholder: 'Phone Number'
```


## TODOs

* Helper methods for generating fields on view
* Field helper methods with Bootstrap, Foundation support
* Method to format contact number as per default pattern
* Method to format contact number as per country of ISD code
* Method to format number as per custom pattern passed

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/has_contact_number. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

