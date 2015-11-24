jQuery ->
  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#picture_image_cropbox').Jcrop
      aspectRatio: 4/3
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#picture_image_crop_x').val(coords.x)
    $('#picture_image_crop_y').val(coords.y)
    $('#picture_image_crop_w').val(coords.w)
    $('#picture_image_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#picture_image_previewbox').css
      width: Math.round(265/coords.w * $('#picture_image_cropbox').width()) + 'px'
      height: Math.round(195/coords.h * $('#picture_image_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(265/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(195/coords.h * coords.y) + 'px'
