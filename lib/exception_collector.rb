class ExceptionCollector
  def collect
    yield
  rescue StandardError => e
    errors << e.message
  end

  def errors
    @errors ||= []
  end

  def output_error_bullet_points
    "\n    - #{@errors.join("\n    - ")}"
  end
end
