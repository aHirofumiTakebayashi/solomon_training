use Croma

defmodule Sakura2.Gettext do
  use SolomonLib.Gettext, otp_app: :sakura2

  defun put_locale(locale :: v[String.t]) :: nil do
    Gettext.put_locale(__MODULE__, locale)
  end
end
