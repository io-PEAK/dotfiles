
# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Java
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="$JAVA_HOME/bin:$PATH"

# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"

# PostgreSQL
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Antigravity-ide
export PATH="$HOME/.antigravity-ide/antigravity-ide/bin:$PATH"