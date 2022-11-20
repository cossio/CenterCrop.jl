module CenterCrop

using EllipsisNotation: (..)

"""
    centercrop(images, output_height, output_width = output_height)

Crops `images` around the center, to an output size of `(output_height, output_width)`.
"""
function centercrop(images::AbstractArray, out_height::Int, out_width::Int = out_height)
    height = size(images, 1)
    width = size(images, 2)

    out_height = min(height, out_height)
    out_width = min(width, out_width)

    y_lo = round(Int, max(1, (height - out_height) / 2))
    x_lo = round(Int, max(1, (width - out_width) / 2))

    return crop(images, y_lo, x_lo, out_height, out_width)
end

function crop(images::AbstractArray, y::Int, x::Int, height::Int, width::Int)
    y_hi = y + height - 1
    x_hi = x + width - 1
    return images[y:y_hi, x:x_hi, ..]
end

end # module
