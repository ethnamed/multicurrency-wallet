require! {
    \react
    \prelude-ls : { filter }
    \whitebox
    \./tools.ls : { cut, money }
    \./naming.ls
    \./seed.ls
    \./use-network.ls
    \./web3.ls
    \./pin.ls : { check }
    \./navigate.ls
}
{ get-container, generate-wallet } = whitebox
.menu
    $width: 400px
    $height: 600px
    $viewport-height: $height / 2.5
    $cards-height: 324px
    $pad: 20px
    $radius: 15px
    height: $height
    width: $width
    position: relative
    >*
        position: absolute
        left: 0
    >.viewport
        width: $width
        height: $height
        top: 0
        overflow: hidden
        >*
            position: absolute
            top: 0
            width: $width
        $viewport-header-height: 32px
        $slide-height: $viewport-height / 2
        >.viewport-icons
            z-index: 5
            height: $viewport-header-height
            position: relative
            display: inline-block
            text-align: left
            >*
                display: inline-block
                color: white
            >span
                margin-top: 7px
                padding: 1px 2px
                border-radius: 2px
                font-size: 12px
                color: white
                vertical-align: top
            >img
                width: $pad / 1.5
                display: inline-block
                margin: $pad / 2 $pad
                cursor: pointer
                &.reload
                    float: left
                &.lock
                    float: right
                &:hover
                    color: #eee
        >.viewport-header
            z-index: 4
            position: relative
            height: $viewport-header-height
            text-align: center
            >.text
                display: inline-block
                padding: 10px 25px
                color: rgba(white, 0.5)
                font-weight: bold
                cursor: pointer
                font-weight: 400
            >.text-line
                height: 3px
            transition: left 1s, background 2s
            &.s1
                left: 50px
                >.text.s1
                    color: white
                    cursor: default
                >.text-line
                    background: linear-gradient(135deg, #FFF 0%, transparent 100%)
            &.s2
                left: 0
                >.text-line
                    background: linear-gradient(135deg, transparent 0%,#FFF 50%, transparent 100%)
                >.text.s2
                    color: white
                    cursor: default
            &.s3
                left: -50px
                >.text-line
                    background: linear-gradient(135deg, transparent 0%, #FFF 100%)
                >.text.s3
                    color: white
                    cursor: default
        >.viewport-switchs
            z-index: 3
            $switch-padd: 13px
            top: $viewport-header-height + $slide-height + $switch-padd * 3
            text-align: center
            >.switch
                border-radius: 100px
                width: 8px
                height: 8px
                margin: 0 4px
                background: rgba(white, 0.5)
                display: inline-block
                cursor: pointer
            &.s1
                >.switch.s1
                    background: white
                    cursor: default
            &.s2
                >.switch.s2
                    background: white
                    cursor: default
            &.s3
                >.switch.s3
                    background: white
                    cursor: default
        >.viewport-decoration
            text-align: center
            z-index: 2
            top: 50px
            >.circle
                display: inline-block
                width: $width
                height: $width
                border-radius: $width
                background: rgba(white, 0.1)
                transition: all 1s
            &.s1>.circle
                width: $width / 1.1
                height: $width / 1.1
                margin-left: -30px
            &.s2>.circle
                width: $width
                height: $width
                margin-left: 0
            &.s3>.circle
                width: $width / 1.1
                height: $width / 1.1
                margin-left: 30px
        >.viewport-background
            background-image: linear-gradient(90deg, #4650E7 0%, #7CC9FF 89%, #9d78b2 100%)
            padding: $viewport-header-height $pad 0 $pad
            z-index: 1
            width: $width * 3
            height: inherit
            transition: left 2s
            &.s1
                left: 0
            &.s2
                left: -$width + $pad * 2
            &.s3
                left: -$width * 2 + $pad * 4
        >.viewport-content
            position: relative
            z-index: 3
            background: transparent
            height: $height / 4.5
            width: $width * 3
            padding: $pad $pad 0 $pad
            text-align: left
            transition: left 1s
            >.slide
                transition: margin-top 0.5s
            &.s1
                left: $pad * 2
                >.slide.s1
                    margin-top: -$pad / 2
            &.s2
                left: -$width + $pad * 8
                >.slide.s2
                    margin-top: -$pad / 2
            &.s3
                left: -$width * 2 + $pad * 14
                >.slide.s3
                    margin-top: -$pad / 2
            font:
                size: 20px
                weight: bold
            line-height: $viewport-height
            >.slide
                z-index: 3
                float: left
                text-align: center
                height: $slide-height
                display: inline-block
                box-sizing: border-box
                vertical-align: top
                border:
                    width: $pad / 2
                    style: solid
                    color: transparent
                >.slide-body
                    cursor: pointer
                    overflow: hidden
                    width: 100%
                    height: 100%
                    vertical-align: top
                    line-height: normal
                    display: inline-block
                    border-radius: $pad / 2
                    background: #FFFFFF
                    box-sizing: border-box
                &.s1
                    width: $width - $pad * 6
                    >.slide-body
                &.s2
                    width: $width - $pad * 6
                    >.slide-body
                        overflow: hidden
                        margin: 0 auto
                        position: relative
                        padding: 23px 0
                        >*
                            display: block
                            max-width: 80%
                            text-align: right
                        >.decor
                            color: rgba(#2743D3, 0.05)
                            position: absolute
                            top: -35px
                            right: -20px
                            font-size: 120px
                        >.currency
                            color: rgba(#2743D3, 0.3)
                        >.amount
                            color: #2743D3
                            >*
                                display: inline-block
                                vertical-align: top
                                line-height: 45px
                            >.symbol
                                font-size: 20px
                                margin-top: -8px
                                font-weight: 100
                            >.number
                                font-size: 50px
                                font-weight: 400
                &.s3
                    width: $width - $pad * 6
                    >.slide-body
state =
    timeout: null
module.exports = ({ store })->
    return null if not store?
    { current, accounts } = store
    lock = ->
        navigate store, \locked
    refresh = ->
        <- web3(store).refresh
    active-page = (page)->
        if current.page is page then \active
    choose-account = (selected, event)-->
        current.account <<< selected
    manage-accounts = (event)->
        current.page = \accounts
    select-page = (name, event)-->
        current.page = name
    pages =
        * \wallets
        * \history
    change-seed = (event)->
        state.timeout = clear-timeout state.timeout
        current.seed = event.target.value
        state.timeout = set-timeout refresh, 2000
    save-seed = ->
        seed.set current.seed
        current.saved-seed = yes
    edit-seed = ->
        store.current.pin = ""
        current.try-edit-seed = yes
        #current.saved-seed = no
    cancel-try = ->
        current.try-edit-seed = no
    enter-pin = (e)->
        store.current.pin = e.target.value
        return if not check(store.current.pin)
        cancel-try!
        current.saved-seed = no
    generate = ->
        return if not confirm "Are you sure you want to override the current seed?"
        current.seed = generate-wallet!.mnemonic
        create-account!
    switch-network = ->
        network = 
            | store.current.network is \mainnet => \testnet
            | _ => \mainnet
        <- use-network web3(store), store, network
    activate-s = (name, event)-->
        store.menu.active = name
    activate-s1 = activate-s \s1
    activate-s2 = activate-s \s2
    activate-s3 = activate-s \s3
    .menu.pug
        .viewport.pug
            .viewport-icons.pug
                img.reload.pug(src="https://res.cloudinary.com/dfbhd7liw/image/upload/v1543530765/wallet/reload.png" on-click=refresh)
                span.network.pug(on-click=switch-network) #{store.current.network}
                span.chevron.pug(on-click=switch-network) ▿
                img.lock.pug(src="https://res.cloudinary.com/dfbhd7liw/image/upload/v1543523582/wallet/Path.png" on-click=lock)
            .viewport-header.viewport-move.pug(class="#{store.menu.active}")
                .text.pug.s1(on-click=activate-s1) Edit Seed
                .text.pug.s2(on-click=activate-s2) Balance
                .text.pug.s3(on-click=activate-s3) Register
                .text-line.pug
            .viewport-background.viewport-move.pug(class="#{store.menu.active}")
            .viewport-content.viewport-move.pug(class="#{store.menu.active}")
                .slide.pug.s1(on-click=activate-s1)
                    .slide-body.pug
                        switch
                            case current.try-edit-seed is yes
                                .pug.box
                                    .pug
                                        input.pug(on-change=enter-pin value="#{current.pin}" placeholder="Enter PIN")
                                    .pug    
                                        button.pug(on-click=cancel-try) Cancel
                            case current.saved-seed is no
                                .pug.box
                                    .pug.title 
                                        span.pug Secret Text
                                        a.pug.generate(on-click=generate) (generate)
                                    textarea.pug(on-change=change-seed value="#{current.seed}" placeholder="Secret words")
                                    .pug
                                        button.pug(on-click=save-seed) Save
                            case current.saved-seed is yes
                                .pug.box
                                    .pug
                                        button.pug(on-click=edit-seed) Edit seed
                .slide.pug.s2(on-click=activate-s2)
                    .slide-body.pug
                        .decor.pug $
                        .currency.pug USD
                        .amount.pug
                            .symbol.pug $
                            .number.pug 
                                if store.current.refreshing is no
                                    .pug #{money current.balance-usd}
                                else
                                    .pug Loading...
                .slide.pug.s3(on-click=activate-s3)
                    .slide-body.pug
                        if store.current.network is \mainnet
                            naming { store }
                        else 
                            .pug Not Available
            .viewport-switchs.viewport-move.pug(class="#{store.menu.active}")
                .switch.pug.s1(on-click=activate-s1)
                .switch.pug.s2(on-click=activate-s2)
                .switch.pug.s3(on-click=activate-s3)
            .viewport-decoration.viewport-move.pug(class="#{store.menu.active}")
                .circle.pug