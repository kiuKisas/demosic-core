defmodule Demosic.Medias.Membrane do
  @moduledoc """
    Membrane component
  """
  use Membrane.Pipeline

  def handle_init(path) do
    spec = %Membrane.Pipeline.Spec{
      children: children(path),
      links: links()
    }
    {{:ok, spec}, %{}}
  end 

  defp children(path) do
    [
      file_src: %Membrane.Element.File.Source{location: path},
      decoder: Membrane.Element.Mad.Decoder,
      converter: %Membrane.Element.FFmpeg.SWResample.Converter{
        output_caps: %Membrane.Caps.Audio.Raw{
          sample_rate: 48_000,
          format: :s16le,
          channels: 2} },
      sink: Membrane.Element.PortAudio.Sink
    ]
  end

  defp links do
    %{
      {:file_src, :output} => {:decoder, :input},
      {:decoder, :output} => {:converter, :input},
      {:converter, :output} => {:sink, :input}
    }

  end
end
