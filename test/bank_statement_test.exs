alias BankStatementClassifier.Classifier, as: Tested
alias BankStatementClassifier.BankStatementItem, as: BSI

defmodule BankStatementClassifier.ClassifierTest do
  use ExUnit.Case
  doctest Tested

  test "Alnatura" do
    assert Tested.classify_item(%BSI{counterparty: " ALNATURA  PRODUKTION  "}) == :un
  end
  test "Unknown" do
    assert Tested.classify_item(%BSI{counterparty: "asdfafdsga325tgsfd"}) == :unknown
  end
end
