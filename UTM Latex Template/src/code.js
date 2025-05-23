// Tokenize input string into Lisp tokens
const tokenize = input =>
  input
    .replace(/\(/g, " ( ")
    .replace(/\)/g, " ) ")
    .trim()
    .split(/\s+/);

// Parse tokens into AST
const parseTokens = tokens => {
  if (tokens.length === 0) {
    throw new SyntaxError("Unexpected EOF while reading");
  }
  const token = tokens.shift();
  if (token === "(") {
    const list = [];
    while (tokens[0] !== ")") {
      list.push(parseTokens(tokens));
      if (tokens.length === 0) {
        throw new SyntaxError("Unexpected EOF while reading");
      }
    }
    tokens.shift(); // Remove ')'
    return list;
  } else if (token === ")") {
    throw new SyntaxError("Unexpected )");
  } else {
    return atom(token);
  }
};

// Convert token to number or symbol
const atom = token => {
  const num = Number(token);
  return isNaN(num) ? token : num;
};

// Top-level parse function
const parseLisp = input => parseTokens(tokenize(input));

// Example usage:
const code = "(define (square x) (* x x))";
const ast = parseLisp(code);
console.log(JSON.stringify(ast, null, 2));
