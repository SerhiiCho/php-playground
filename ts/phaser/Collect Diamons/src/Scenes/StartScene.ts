import Phaser from 'phaser'
import { sceneConfig } from '@/config'
import imageBackground from '@/assets/start.jpg'
import startGameImage from '@/assets/start-game-button.png'
import startGameImageHover from '@/assets/start-game-button-hover.png'
import StartButton from '@/Models/StartButton'

export default class StartScene extends Phaser.Scene {
    private canvasWidth: number = 0
    private canvasHeight: number = 0
    private startButton: StartButton | undefined

    constructor() {
        super(sceneConfig.start)
    }

    public preload(): void {
        this.load.image('start-background', imageBackground)
        this.load.image('start-game', startGameImage)
        this.load.image('start-game-hover', startGameImageHover)

        this.canvasWidth = Number(this.sys.game.config.width)
        this.canvasHeight = Number(this.sys.game.config.height)
    }

    public create(): void {
        this.add
            .sprite(0, 0, 'start-background')
            .setPosition(this.canvasWidth / 2, this.canvasHeight / 2)

        this.startButton = new StartButton(
            this.drawButton('start-game'),
            this.drawButton('start-game-hover'),
        )

        this.startButton.create()

        this.startButton.handleButtonClick(() => {
            this.scene.start(sceneConfig.play.key)
        })
    }

    private drawButton(button: string): Phaser.GameObjects.Sprite {
        const btn = this.add
            .sprite(0, 0, button)
            .setPosition(this.canvasWidth / 2, (this.canvasHeight / 2) + 50)
            .setInteractive()

        btn.scale = 0.4

        return btn
    }
}