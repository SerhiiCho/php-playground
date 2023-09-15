package ast

import (
	"bytes"
	"monkey/token"
)

type InfixExpression struct {
	Token    token.Token // The infix token, e.g. +, -, *
	Left     Expression
	Operator string
	Right    Expression
}

func (ie *InfixExpression) expressionNode() {
}

func (ie *InfixExpression) TokenLiteral() string {
	return ie.Token.Literal
}

func (ie *InfixExpression) String() string {
	var out bytes.Buffer

	out.WriteString("(")
	out.WriteString(ie.Left.String())
	out.WriteString(" " + ie.Operator + " ")
	out.WriteString(ie.Right.String())
	out.WriteString(")")

	return out.String()
}
