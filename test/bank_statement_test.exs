alias BankStatementClassifier.Classifier, as: Tested
alias BankStatementClassifier.BankStatementItem, as: BSI

defmodule BankStatementClassifier.ClassifierTest do
  use ExUnit.Case
  doctest Tested

  test "Alnatura" do
    assert Tested.classify_item(%BSI{counterparty: "ALNATURA PRODUKTIONS U\\HAMBURG      \\"}) == :un
  end
  test "Edeka" do
    assert Tested.classify_item(%BSI{counterparty: "Edeka-Schlemmermarkt  \\Hamburg"}) == :un
    assert Tested.classify_item(%BSI{counterparty: "EDEKA Timmer          \\Hamburg"}) == :un
  end
  test "Aldi" do
    assert Tested.classify_item(%BSI{counterparty: "ALDI 03010            \\Hamburg"}) == :un
  end
  test "Unknown" do
    assert Tested.classify_item(%BSI{counterparty: "asdfafdsga325tgsfd"}) == :unknown
  end
end
