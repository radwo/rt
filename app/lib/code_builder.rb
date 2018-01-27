class CodeBuilder
  def call(code, input, template)
    template.gsub('__INPUT__', input).gsub('__CODE__', code)
  end
end
