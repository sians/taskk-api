class BaseService
  include ActiveModel::Model

  class << self
    def call(*args)
      new(*args).call
    end
  end

  def call
    return false unless valid?

    @success = call_after_validation

    @success
  end

  def call_after_validation
    raise NotImplementedError.new("#{self.class.name}#call_after_validation is an abstract method.")
  end

  def clone_errors(model)
    return unless model

    model.errors.each do |attribute, error|
      errors.add(attribute, error)
    end
  end

  def present_update_attrs(obj)
    update_params = {}
    self.instance_variables.each do |v|
      str = v.to_s[1..-1]
      if obj.is_a?(Class)
        if obj.attribute_names.include?(str) || obj.attribute_names.include?("#{str}_id")
          update_params[str] = self.instance_variable_get(v)
        end
      else
        if obj.attributes.key?(str) || obj.attributes.key?("#{str}_id")
          update_params[str] = self.instance_variable_get(v)
        end
      end
    end

    update_params
  end
end
