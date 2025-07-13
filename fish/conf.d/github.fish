
if command -sq gh
  set -gx GH_NO_UPDATE_NOTIFIER 'true'
  set -gx GH_NO_EXTENSION_UPDATE_NOTIFIER 'true'
end
