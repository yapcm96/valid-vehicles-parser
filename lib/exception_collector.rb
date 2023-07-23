# frozen_string_literal: true

class ExceptionCollector
  def collect
    yield
  rescue StandardError => e
    errors << e.message
  end

  def errors
    @errors ||= []
  end

  def output_error_list
    "\n    - #{@errors.join("\n    - ")}"
  end
end
