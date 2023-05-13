# Angry Robots game prototype

A fully functional 2D game prototype created using **Godot 4** and **GDScript**.

The idea of the game is similar to [Dodge the Creeps!](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/index.html) from the Godot's User Manual:

<p align="center">
<img src="images/angry_robots_sketch.png" alt="The game idea sketch" width="560"/>
</p>

1. **Main menu:** Shows "Angry Robots" in the center of the screen, the current and the highest score, and the "Start" button.

2. **"Ready?" screen:** When the player clicks the "Start" button (or presses `Enter`), the game shows the main character and the message "Ready?".

3. **Gameplay:** In a few seconds, the "Ready?" message disappears, and the enemies start to spawn randomly along the edge of the screen. They move at random speeds and in random directions.

    The character can be controlled using `W`, `A`, `S`, `D` keys (or the four Arrow keys) to move in all four directions, and the `Space` key to give the character a rapid boost in speed.

    The character should dodge the enemies. The player gets **1** score point every 1 second.

    The character can also rapidly accelerate and hit the enemies getting **10** points for each destroyed enemy. But this is risky since there is a caveat: the character cannot accelerate immediately after the previous acceleration, i.e., there is a few-second cooldown period! The enemies can destroy the character immediately after it slows down. This is a sort of "high-risk, high-reward" situation.

4. **"Game Over" screen:** If angry robots (the enemies) hit the main character while it is not attacking, the game is over. The character disappears, and the enemies keep moving out of the game window. The score counter stops.

    If the current score is larger than the highest score, the latter will be updated accordingly. The game automatically switches back to the main menu (Screen 1).

## The main menu screenshot

<p align="center">
<img src="images/angry_robots_menu.png" alt="The main menu screenshot" width="520"/>
</p>

## The gameplay screenshot

<p align="center">
<img src="images/angry_robots_game.png" alt="The gameplay screenshot" width="520"/>
</p>

## Video

The gameplay is demonstrated in this quick YouTube [video](https://www.youtube.com/watch?v=39mzb6HAR-E).

## Tutorial

Here is the link to the tutorial (see Chapter 8): [https://www.amazon.com/dp/B0C4YJ1T4X](https://www.amazon.com/dp/B0C4YJ1T4X)

In this practical book, you will get hands-on experience working with Godot 4 and writing your own code in GDScript.

You will learn how to create applications – usually games – from outlining the idea to releasing the final product. The material in this book is organized systematically, from how to install Godot, set up the first scene, and add a custom script to prototyping and creating a fully functional game. You will learn how to use GDScript in your projects efficiently, even if you have no prior experience in programming and game development.
