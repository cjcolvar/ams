module DisabledFields
  extend ActiveSupport::Concern
  included do
    class_attribute :disabled_fields, :readonly_fields
    self.disabled_fields = []
    self.readonly_fields = []
    delegate :errors, to: :model
  end

  def disabled?(field)
    self.disabled_fields.include?(field)
  end
  def readonly?(field)
    self.readonly_fields.include?(field) && self.send(field).present?
  end
end

