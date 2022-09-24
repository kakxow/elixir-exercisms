defmodule RPNCalculator do
  def calculate!(stack, operation) do
    operation.(stack)
  end

  def calculate(stack, operation) do
    try do
      operation.(stack)
      {:ok, "operation completed"}
    rescue
      _e in _ -> :error
    end
  end

  def calculate_verbose(stack, operation) do
    try do
      operation.(stack)
      {:ok, "operation completed"}
    rescue
      e in _ -> {:error, e.message}
    end
  end
end
