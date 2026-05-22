var videoData = video_draw()
var videoStatus = videoData[0]
if (videoStatus == 0) {
    draw_surface(videoData[1], 0, -40)
}