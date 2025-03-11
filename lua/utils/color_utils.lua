local M = {}

M.rgb_to_hex = function(r, g, b)
  -- Ensure RGB values are valid
  if r < 0 or r > 255 or g < 0 or g > 255 or b < 0 or b > 255 then
    error("RGB values must be in the range [0, 255]")
  end

  -- Convert each component to a two-digit hexadecimal and concatenate
  return string.format("#%02X%02X%02X", r, g, b)
end

return M;
