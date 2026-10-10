#!/usr/bin/env bash
set -Eeuo pipefail

ensure_sdkman() {
  if ! command -v sdk >/dev/null 2>&1; then
    if [[ ! -d "${HOME}/.sdkman" ]]; then
      echo "Installing SDKMAN..."
      curl -s "https://get.sdkman.io" | bash
    fi

    if [[ -f "${HOME}/.sdkman/bin/sdkman-init.sh" ]]; then
      # shellcheck source=/dev/null
      set +u
      . "${HOME}/.sdkman/bin/sdkman-init.sh"
      set -u
    else
      echo "SDKMAN initialization script not found at ${HOME}/.sdkman/bin/sdkman-init.sh" >&2
      return 1
    fi
  fi
}

install_java21() {
  ensure_sdkman

  if ! sdk current java 2>/dev/null | grep -Eq '21\.'; then
    echo "Installing Java 21..."
    sdk install java 21.0.8-tem || \
    sdk install java 21.0.7-tem || \
    sdk install java 21.0.1-tem || {
      echo "Could not install Java 21 via SDKMAN." >&2
      return 1
    }
  fi

  if sdk current java 2>/dev/null | grep -Eq '21\.'; then
    sdk default java 21.0.8-tem 2>/dev/null || \
    sdk default java 21.0.7-tem 2>/dev/null || \
    sdk default java 21.0.1-tem 2>/dev/null || true
  fi

  export JAVA_HOME="${HOME}/.sdkman/candidates/java/current"
  export PATH="${JAVA_HOME}/bin:${PATH}"
}

install_java21

java -version
javac -version

echo "JAVA_HOME=${JAVA_HOME}"
echo "You may need to start a new shell or re-source your profile for JAVA_HOME to persist."
