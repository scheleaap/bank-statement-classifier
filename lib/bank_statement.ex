defmodule BankStatementClassifier.BankStatementItem do
  @moduledoc """
  A bank statement item.
  """

  @enforce_keys [:counterparty]
  defstruct [:counterparty, :description]
end

defmodule BankStatementClassifier.Classifier do
  @moduledoc """
  Classifies bank statement items.
  """
  @matchers [{~r/alnatura\s+produktion/i, :un}]

  def classify_item(item) do
    @matchers
    |> Stream.map(
         fn x -> case Regex.match?(elem(x, 0), item.counterparty) do
                   true -> elem(x, 1)
                   false -> :nil
                 end
         end
       )
    |> Stream.filter(&(&1 != :nil))
    |> Stream.take(1)
    #|> Stream.map(&IO.inspect(&1))
    |> Enum.to_list()
    |> List.first()
    |> case do
         :nil -> :unknown
         x -> x
       end
  end
end
