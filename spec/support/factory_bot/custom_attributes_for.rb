class CustomAttributesFor
  def association(runner)
    runner.run(:create)
  end

  def result(evaluation)
    evaluation.object.attributes # this assumes your instance responds to attributes and returns a hash, which AR::Base subclasses will do
  end
end

FactoryBot.register_strategy(:custom_attributes_for, CustomAttributesFor)