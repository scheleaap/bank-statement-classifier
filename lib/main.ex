#alias PersonBirthdate, as: Bday
#
#birthdates = [%Bday{}]

alias BankStatementClassifier.Classifier, as: Classifier
alias BankStatementClassifier.BankStatementItem, as: BSI

Classifier.classify_item(%BSI{counterparty: "Alnatura"})
