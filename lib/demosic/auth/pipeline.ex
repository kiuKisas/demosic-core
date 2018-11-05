defmodule Demosic.Auth.Pipeline do
  @moduledoc """
  Pipeline for Authentification
  """
  use Guardian.Plug.Pipeline,
    otp_app: :demosic,
    error_handler: Demosic.Auth.ErrorHandler,
    module: Demosic.Auth.Guardian

  # If there is a session token, restrict it to an access token and validate it
  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  # If there is an authorization header, restrict it to an access token and validate it
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  # Load the user if either of the verifications worked
  plug Guardian.Plug.LoadResource, allow_blank: true
end
