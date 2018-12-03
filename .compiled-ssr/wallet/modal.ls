require! {
    \react
    \./scroll-top.ls
}
# .modal-container925330035
#     $e: url(https://res.cloudinary.com/dfbhd7liw/image/upload/v1543785751/wallet/Combined_Shape.png)
#     $width: 400px
#     $height: 700px
#     z-index: 999
#     overflow: hidden
#     height: $height
#     width: $width
#     position: fixed
#     >.modal
#         width: $width
#         height: $height
#         position: relative
#         >*
#             position: absolute
#             overflow: hidden
#             left: 0
#         >.bg
#             height: inherit
#             width: inherit
#             bottom: 0
#         $size: 400px
#         >.install
#             box-shadow: 0 -10px 20px 0 rgba(0,0,0,0.15)
#             $pad: 3px
#             width: $size - $pad * 2
#             height: $size - $pad * 2 + 50px
#             margin: $pad
#             background: white
#             box-sizing: border-box
#             border-radius: 20px
#             padding: 10px
#             text-align: center
#             >.close-area
#                 text-align: right
#                 >.close
#                     cursor: pointer
#                     text-align: center
#                     $size: 40px
#                     display: inline-block
#                     background: #DDDDDD
#                     width: $size
#                     height: $size
#                     border-radius: $size
#                     line-height: 40px
#                     color: white
#             >.title
#                 color: #677897
#                 font-size: 22px
#             >.animation
#                 position: relative
#                 height: 270px
#                 >.coin-container
#                     @-webkit-keyframes spin
#                         from
#                             -webkit-transform: rotateY(0deg)
#                         to
#                             -webkit-transform: rotateY(360deg)
#                     height: 160px
#                     width: 160px
#                     position: absolute
#                     top: 50%
#                     left: 50%
#                     margin-top: -80px
#                     margin-left: -80px
#                     -webkit-perspective: 1000
#                     -webkit-box-reflect: below 0 linear-gradient(hsla(0, 0%, 100%, 0), hsla(0, 0%, 100%, 0) 45%, hsla(0, 0%, 100%, 0.2))
#                     -webkit-filter: saturate(1.45) hue-rotate(2deg)
#                     >.coin
#                         height: 160px
#                         width: 160px
#                         position: absolute
#                         -webkit-transform-style: preserve-3d
#                         -webkit-transform-origin: 50%
#                         -webkit-animation: spin 5s infinite
#                         -webkit-animation-timing-function: linear
#                         >.front, >.back
#                             position: absolute
#                             height: 160px
#                             width: 160px
#                             border-radius: 50%
#                             background-size: cover
#                         >.front
#                             -webkit-transform: translateZ(8px)
#                         >.back
#                             -webkit-transform: translateZ(-8px) rotateY(180deg)
#                         >.side
#                             -webkit-transform: translateX(72px)
#                             -webkit-transform-style: preserve-3d
#                             -webkit-backface-visibility: hidden
#                             >.spoke
#                                 height: 160px
#                                 width: 16px
#                                 position: absolute
#                                 -webkit-transform-style: preserve-3d
#                                 -webkit-backface-visibility: hidden
#                                 &:before, &:after
#                                     content: ''
#                                     display: block
#                                     height: 15.68274245px
#                                     width: 16px
#                                     position: absolute
#                                     -webkit-transform: rotateX(84.375deg)
#                                     background: hsl(42, 52%, 68%)
#                                     background: black
#                                     background-size: 100% 1px
#                                 &:before
#                                     -webkit-transform-origin: top center
#                                 &:after
#                                     bottom: 0
#                                     -webkit-transform-origin: center bottom
#                                 &:nth-child(16)
#                                     -webkit-transform: rotateY(90deg) rotateX(180deg)
#                                 &:nth-child(15)
#                                     -webkit-transform: rotateY(90deg) rotateX(168.75deg)
#                                 &:nth-child(14)
#                                     -webkit-transform: rotateY(90deg) rotateX(157.5deg)
#                                 &:nth-child(13)
#                                     -webkit-transform: rotateY(90deg) rotateX(146.25deg)
#                                 &:nth-child(12)
#                                     -webkit-transform: rotateY(90deg) rotateX(135deg)
#                                 &:nth-child(11)
#                                     -webkit-transform: rotateY(90deg) rotateX(123.75deg)
#                                 &:nth-child(10)
#                                     -webkit-transform: rotateY(90deg) rotateX(112.5deg)
#                                 &:nth-child(9)
#                                     -webkit-transform: rotateY(90deg) rotateX(101.25deg)
#                                 &:nth-child(8)
#                                     -webkit-transform: rotateY(90deg) rotateX(90deg)
#                                 &:nth-child(7)
#                                     -webkit-transform: rotateY(90deg) rotateX(78.75deg)
#                                 &:nth-child(6)
#                                     -webkit-transform: rotateY(90deg) rotateX(67.5deg)
#                                 &:nth-child(5)
#                                     -webkit-transform: rotateY(90deg) rotateX(56.25deg)
#                                 &:nth-child(4)
#                                     -webkit-transform: rotateY(90deg) rotateX(45deg)
#                                 &:nth-child(3)
#                                     -webkit-transform: rotateY(90deg) rotateX(33.75deg)
#                                 &:nth-child(2)
#                                     -webkit-transform: rotateY(90deg) rotateX(22.5deg)
#                                 &:nth-child(1)
#                                     -webkit-transform: rotateY(90deg) rotateX(11.25deg)
#             >.button
#                 box-sizing: border-box
#                 text-align: center
#                 background: blue
#                 cursor: pointer
#                 color: white
#                 margin: 10px 40px
#                 padding: 13px 0px
#                 border-radius: 100px
#                 background: #6CA7ED
#             >.decoration
#                 width: 100%
#                 >.item
#                     position: absolute
#                     top: 150px
#                     display: inline-block
#                     width: 100px
#                     height: 130px
#                     &.left
#                         left: -20px
#                         background-image: $e
#                         transform: scaleX(-1)
#                     &.right
#                         right: -20px
#                         background-image: $e
#         @keyframes init
#             0%
#                 background: transparent
#                 >.install
#                     bottom: 0
#             100%
#                 background: rgba(black, 0.6)
#                 >.install
#                     bottom: 0
#         @keyframes init-install
#             0%
#                 bottom: -$size * 2
#             100%
#                 bottom: 0
#         >.bg
#             animation: init .5s forwards
#         >.install
#             animation: init-install .5s forwards
export modal-control = (store)->
    { text, callback, enabled } = store.ask
    return if enabled isnt yes
    accept = ->
        accept-ask store
    reject = ->
        cancel-ask store
    coin-image=
        background-image: "url(#{store.ask.image})"
    react.create-element 'div', { className: 'modal-container modal-container925330035' }, children = 
        react.create-element 'div', { className: 'modal' }, children = 
            react.create-element 'div', { className: 'bg' }
            react.create-element 'div', { className: 'blur' }
            react.create-element 'div', { className: 'install' }, children = 
                react.create-element 'div', { className: 'decoration' }, children = 
                    react.create-element 'div', { className: 'left item' }
                    react.create-element 'div', { className: 'right item' }
                react.create-element 'div', { className: 'close-area' }, children = 
                    react.create-element 'div', { on-click: reject, className: 'close' }, ' X'
                react.create-element 'div', { className: 'title' }, ' ' + text
                react.create-element 'div', { className: 'animation' }, children = 
                    react.create-element 'div', { className: 'coin-container' }, children = 
                        react.create-element 'div', { className: 'coin' }, children = 
                            react.create-element 'div', { style: coin-image, className: 'front' }
                            react.create-element 'div', { style: coin-image, className: 'back' }
                            react.create-element 'div', { className: 'side' }, children = 
                                for i in [1 to 15]
                                    react.create-element 'div', { className: 'spoke' }
                react.create-element 'div', { on-click: accept, className: 'button' }, ' INSTALL'
current =
    timer: null
make-choice = (err)-> (store)->
    current.timer = clear-timeout current.timer
    cb = store.ask.callback
    store.ask.enabled = no
    store.ask.text = ""
    store.ask.callback = null
    store.ask.image = ""
    cb err if typeof! cb is \Function
accept-ask = make-choice null
export cancel-ask = make-choice \Cancelled
reduce-or-cancel = (store, timer-sec) -> (_)->
    current.timer = clear-timeout current.timer
    return cancel-ask store if timer-sec <= 0
    current.timer = set-timeout reduce-or-cancel(store, timer-sec - 1), 1000
plug = (type)-> (store, plugin, cb)->
    return cb "store is required" if typeof! store isnt \Object
    return cb "plugin is required" if typeof! plugin isnt \Object
    return cb "Cannot ask because ask modal is busy with another task" if store.ask.enabled is yes
    store.ask.enabled = yes
    store.ask.text = "#{plugin.token} #{plugin.type}".to-upper-case!
    store.ask.image = plugin.image
    store.ask.callback = cb
    scroll-top!
    reduce-or-cancel(store, 11)!
export install = plug \install
export replace = plug \replace