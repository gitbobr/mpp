require 'mail'
class EmailValidator < ActiveModel::EachValidator
    def validate_each(record,attribute,value)
      m = Mail::Address.new(value)     
      r = m.domain.present? && m.domain.match('\.') && m.address == value && m.domain == "student.karazin.ua"
      record.errors.add attribute, (options[:message] || "must have domain student.karazin.ua") unless r
    end
end