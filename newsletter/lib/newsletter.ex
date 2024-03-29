defmodule Newsletter do
  def read_emails(path) do
    File.read!(path)
    |> String.split()
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    emails = read_emails(emails_path)
    log_file = open_log(log_path)
    do_send(emails, send_fun, log_file)
    close_log(log_file)
  end

  defp do_send([], _, _), do: :ok

  defp do_send([h | t], send_fun, log_file) do
    if(send_fun.(h) == :ok, do: log_sent_email(log_file, h))
    do_send(t, send_fun, log_file)
  end
end
