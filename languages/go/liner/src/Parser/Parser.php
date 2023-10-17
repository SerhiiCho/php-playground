<?php

declare(strict_types=1);

namespace Serhii\Liner\Parser;

use Closure;
use Serhii\Liner\Ast\Expression;
use Serhii\Liner\Ast\ExpressionStatement;
use Serhii\Liner\Ast\IntegerLiteral;
use Serhii\Liner\Ast\Program;
use Serhii\Liner\Ast\ReturnStatement;
use Serhii\Liner\Ast\Statement;
use Serhii\Liner\Lexer\Lexer;
use Serhii\Liner\Token\Token;
use Serhii\Liner\Token\TokenType;

class Parser
{
    private ?Token $curToken = null;
    private ?Token $peekToken = null;
    private array $errors = [];

    /**
     * @var array<string, Closure>
     */
    private array $prefixParseFns = [];

    /**
     * @var array<string, Closure>
     */
    private array $infixParseFns = [];

    public function __construct(private Lexer $lexer)
    {
        $this->nextToken();
        $this->nextToken();

        $this->registerPrefix(TokenType::INT, $this->parseIntegerLiteral());
    }

    public function parseProgram(): Program
    {
        $statements = [];

        while (!$this->curTokenIs(TokenType::EOF)) {
            $stmt = $this->parseStatement();

            if ($stmt !== null) {
                $statements[] = $stmt;
            }

            $this->nextToken();
        }

        return new Program($statements);
    }

    public function errors(): array
    {
        return $this->errors;
    }

    private function registerPrefix(TokenType $tokenType, Closure $fn)
    {
        $this->prefixParseFns[$tokenType->value] = $fn;
    }

    private function registerInfix(TokenType $tokenType, Closure $fn)
    {
        $this->infixParseFns[$tokenType->value] = $fn;
    }

    private function curTokenIs(TokenType $tokenType): bool
    {
        return $this->curToken->type === $tokenType;
    }

    private function peekTokenIs(TokenType $tokenType): bool
    {
        return $this->peekToken->type === $tokenType;
    }

    private function nextToken(): void
    {
        $this->curToken = $this->peekToken;
        $this->peekToken = $this->lexer->nextToken();
    }

    private function parseStatement(): ?Statement
    {
        return match($this->curToken->type) {
            TokenType::RETURN => $this->parseReturnStatement(),
            default => $this->parseExpressionStatement(),
        };
    }

    private function parseReturnStatement(): ?ReturnStatement
    {
        $token = $this->curToken;

        $this->nextToken();

        $stmt = new ReturnStatement($token, $this->parseExpression());

        if ($this->peekTokenIs(TokenType::PERIOD)) {
            $this->nextToken();
        }

        return $stmt;
    }

    private function parseExpressionStatement(): ExpressionStatement
    {
        $stmt = new ExpressionStatement($this->curToken, $this->parseExpression());

        if ($this->peekTokenIs(TokenType::PERIOD)) {
            $this->nextToken();
        }

        return $stmt;
    }

    private function parseExpression(): ?Expression
    {
        $prefix = $this->prefixParseFns[$this->curToken->type->value] ?? null;

        if ($prefix === null) {
            $e = "no prefix parse function for token '{$this->curToken->type->value}' found";
            $this->errors[] = $e;
            return null;
        }

        $leftExp = $prefix();

        while (!$this->peekTokenIs(TokenType::PERIOD)) {
            $infix = $this->infixParseFns[$this->peekToken->type->value] ?? null;

            if ($infix === null) {
                return $leftExp;
            }

            $this->nextToken();

            $leftExp = $infix($leftExp);
        }

        return $leftExp;
    }

    private function parseIntegerLiteral(): Closure
    {
        return function (): ?Expression {
            $num = (int) $this->curToken->literal;

            if (!is_numeric($this->curToken->literal)) {
                $this->errors[] = "'{$this->curToken->literal}' is not numeric";
                return null;
            }

            return new IntegerLiteral($this->curToken, $num);
        };
    }
}