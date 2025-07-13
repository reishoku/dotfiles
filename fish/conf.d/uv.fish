
# Do not let the installer modify user $PATH
set -gx INSTALLER_NO_MODIFY_PATH 'true'

if command -sq uv
  set -gx UV_CONCURRENT_BUILDS 10
  set -gx UV_INSTALL_DIR $HOME/.local/bin
  set -gx UV_NATIVE_TLS 'true'

  set -gx UV_PYTHON_PREFERENCE 'only-system'
  set -gx UV_PYTHON_DOWNLOADS 'never'

  set -gx UV_NO_MODIFY_PATH 'true'
end
