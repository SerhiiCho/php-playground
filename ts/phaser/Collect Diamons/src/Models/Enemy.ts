import Phaser from 'phaser'
import type Position from '@/Models/Position'

export default class {
    private speed: number = 1

    private animations = {
        idle: 'enemyIdle',
        walk: 'enemyWalk',
    }

    constructor(public sprite: Phaser.GameObjects.Sprite) {
    }

    public create(position: Position): void {
        this.sprite.setPosition(position.x, position.y)
        this.sprite.setInteractive()

        this.sprite.anims.create({
            key: this.animations.walk,
            frames: this.sprite.anims.generateFrameNumbers(this.animations.walk, {
                start: 0,
                end: 5,
            })
        })
    }

    public update(playerPosition: Position): void {
        this.moveTowardsPlayer(playerPosition)
        this.sprite.anims.play(this.animations.walk, true)
    }

    public isCollidingWith(object: Phaser.GameObjects.Sprite): boolean {
        const distance = Phaser.Math.Distance.Between(
            this.sprite.x,
            this.sprite.y,
            object.x,
            object.y
        )

        return distance < 20
    }

    private moveTowardsPlayer(playerPosition: Position): void {
        if (this.sprite.x < playerPosition.x) {
            this.sprite.x += this.speed
            this.sprite.flipX = false
        } else if (this.sprite.x > playerPosition.x) {
            this.sprite.x -= this.speed
            this.sprite.flipX = true
        }

        if (this.sprite.y < playerPosition.y) {
            this.sprite.y += this.speed
        } else if (this.sprite.y > playerPosition.y) {
            this.sprite.y -= this.speed
        }
    }
}