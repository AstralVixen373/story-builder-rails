# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# --- Characters ---

Character.destroy_all

puts "Creating characters..."
sleep 3

rosalina = Character.find_or_create_by!(name: "Rosalina") do |c|
  c.description = "The mysterious guardian of the cosmos and mother figure to the Lumas. Rosalina travels the universe 
  aboard the Comet Observatory, watching over the stars from afar. Behind her calm, ethereal demeanor lies a deep sorrow 
  she has carried since childhood, a grief she has learned to hold gently, like starlight in cupped hands."
end

luma = Character.find_or_create_by!(name: "Luma") do |c|
  c.description = "A small, round star creature with a gentle glow and an unshakeable curiosity about the universe. 
  Lumas are the children Rosalina has gathered across the cosmos. They are playful and warm, and they regard Rosalina 
  with an adoration that borders on reverence, though they would never hesitate to tug at her gown to get her attention."
end

astra = Character.find_or_create_by!(name: "Astra") do |c|
  c.description = "A young girl adventurer with dark hair shot through with a single white streak, as though a star 
  grazed her on the way past. Astra has the restless energy of someone who has always suspected the universe is 
  bigger than anyone let on, and the stubbornness to go find out. She arrived at the Comet Observatory by accident, 
  or so she claims."
end

# --- Locations ---

Location.destroy_all

puts "Creating locations..."
sleep 3

observatory = Location.find_or_create_by!(name: "Comet Observatory") do |l|
  l.description = "A vast and beautiful spacecraft shaped like a comet, home to Rosalina and her Lumas. Its domed library 
  sits at the heart of the ship, filled with the soft hum of the cosmos and the faint smell of old pages. The Grand Dome 
  opens directly to the stars, no glass, no barrier, just the cold and infinite dark held at bay by something that feels 
  very much like love."
end

# --- Chapter ---

Chapter.destroy_all

puts "Creating chapters..."
sleep 3

chapter = Chapter.find_or_create_by!(title: "A Light at the Edge of the Sky") do |c|
  c.description = "Astra arrives at the Comet Observatory for the first time. Rosalina receives her, and for one quiet 
  evening, the two of them sit with the stars."
  c.position = 1
end

# --- Scenes ---

Scene.destroy_all

puts "Creating scenes..."
sleep 3

Scene.find_or_create_by!(title: "The Observatory", chapter: chapter) do |s|
  s.position = 1
  s.content = <<~TEXT
    The Comet Observatory had no front door, not really. One moment Astra was falling through the dark between galaxies,
    and the next she was standing on the observatory's deck, the wind knocked out of her and a Luma sitting squarely on
    her head.

    "You made it!" the Luma announced, as though it had been waiting for exactly this.

    The observatory stretched out around her, domes and towers and bridges spiraling up into a sky so full of stars it
    looked like someone had spilled them. It smelled of cold stone and something sweet, faintly floral, that she couldn't
    place.

    "Welcome."

    She turned. The woman was standing at the top of a short flight of steps, her silver hair drifting as though gravity
    were merely a suggestion. She was taller than Astra expected. Everything about her was still in the way that deep
    water is still.

    "I am Rosalina," she said. "Keeper of the Comet Observatory. The Lumas have told me about you." A pause, and
    something almost like a smile. "They say you arrived by falling."

    Astra pushed the Luma off her head. "I meant to do that."

    "Of course," Rosalina said. "Come inside. The cold out here has teeth."
  TEXT
end

Scene.find_or_create_by!(title: "The Library", chapter: chapter) do |s|
  s.position = 2
  s.content = <<~TEXT
    The library was round and warm and lined from floor to ceiling with books. A group of Lumas had arranged themselves
    on a low cushioned bench, pressed together like a row of small, glowing fruit. Rosalina settled into the chair at
    their center with a practised ease, a large storybook open across her knees.

    Astra sat cross-legged on the floor nearby, not entirely sure how she had ended up there. One of the Lumas had
    simply taken her hand and led her in, and it had seemed rude to refuse.

    "She reads to us every night," the Luma pressed against her arm whispered.

    Rosalina's voice, when she began, was low and unhurried. She read of a little girl who had lost her mother and gone
    looking for her among the stars, and of the strange new family she had found there. The Lumas listened with the rapt
    attention of children who knew the story by heart and loved it all the more for it.

    Astra watched Rosalina's face as she read. There was something in it she recognised; the particular way a person
    looks when they are telling a true thing in the shape of a made-up one. She reached up without thinking and touched
    the white streak in her hair.

    When Rosalina closed the book, the Lumas let out a long, collective sigh.

    "Again?" one of them asked.

    "Tomorrow," Rosalina said, with the patience of someone who had said it ten thousand times before and would say it
    ten thousand more. She looked up then, across the room, and found Astra's eyes.

    Neither of them said anything. Outside, the stars continued their ancient, indifferent burning.
  TEXT
end

# --- Character relationships ---

CharacterRelationship.destroy_all

puts "Creating characters relationships..."
sleep 3

CharacterRelationship.find_or_create_by!(character: rosalina, linked_character: luma)
CharacterRelationship.find_or_create_by!(character: rosalina, linked_character: astra)

# --- Character–Location links ---

CharacterLocation.destroy_all

puts "Linking locations to characters..."
sleep 3

CharacterLocation.find_or_create_by!(character: rosalina, location: observatory)
CharacterLocation.find_or_create_by!(character: luma, location: observatory)
CharacterLocation.find_or_create_by!(character: astra, location: observatory)
