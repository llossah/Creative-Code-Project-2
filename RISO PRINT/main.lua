require("L5")

-- Store the pattern between animation updates
pattern = {}

function setup()
  size(800, 500)

  -- Riso inspired color palette
  colors = {
    {0, 120, 191}, -- Riso Blue
    {255, 72, 176},  -- Fluorescent Pink
    {255, 232, 0}, -- RISO Yellow
    {0, 0, 0} -- Black
  }

  windowTitle("Kente Rhythms")
  describe('A changing Kente-inspired geometric pattern')

  -- Generate the first pattern
  generatePattern()
end

-- Generate a new arrangement
function generatePattern()
  pattern = {}

  for i = 1, 72 do
    pattern[i] = {
      motif= math.floor (random(1,4)),
      color= math.floor(random(1,5)),
      scale = random(0.7, 1.1)
    }
  end
  end

function draw()
  background(255)

  -- Repeating square grid
  for row= 0,5 do
    for col = 0, 11 do

      --Calculate the position
      local x = 80 + col * 53
      local y = 65 + row * 53

      -- Find this square's stored pattern
      local index = row * 12 + col + 1
      local cell = pattern[index]

      -- Draw a square outline
      stroke(0)
      noFill()
      rect(x,y, 45,45)

      -- Calculate center
      local centerX= x+22.5
      local centerY= y+22.5

      -- Apply stored random color
      local selectedColor = colors[cell.color]
      noStroke()
      fill(selectedColor[1], selectedColor[2], selectedColor[3])

      -- Apply stored random motif and size
      local motif = cell.motif
      local s = cell.scale

      if motif == 1 then
        
        -- Diamond with varying size
        quad(
          centerX, centerY - 15 * s,
          centerX + 12 * s, centerY,
          centerX, centerY + 15 * s,
          centerX -12 * s, centerY
        )

      elseif motif == 2 then

      -- Vertical stripes with varying height
      local h = 27 * s
      local top = centerY - h / 2

      rect(x+12, top,5,h)
      rect(x+20, top,5,h)
      rect(x+28, top,5,h)

    else
      -- Horizontal bars with varying width
      local w = 27 * s
      local left = centerX - w / 2

      rect(left,y+12,w,5)
      rect(left,y+20,w,5)
      rect(left,y+28,w,5)
    end
    end
  end
end
function keyPressed()
  save("Kente_Rhythms_RISO.png")
end