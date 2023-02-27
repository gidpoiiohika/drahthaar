class Dog < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "father", "id", "mother", "name", "stigma", "updated_at"]
  end
end
