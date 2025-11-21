---
title: "The Game of Life"
date: 2025-11-20
tags: 'programming'
---
In this article, we implement Conway's Game of Life, see {{< cite "Conway" >}} for more information.
This is more of an exercise for myself to determine how to insert and play around with JavaScript directly within my Hugo setup.

## Background
For context, and for those of you unaware, Conway's famous *Game of Life*, is a simple game that aims to emulate in an extremely basic sense, *life*.
More specifically, with a few very simple rules underpinning the game, you can create an abundance of complexity, including a general purpose
computer, and even the *Game of Life* itself, see [here](https://www.youtube.com/watch?v=xP5-iIeKXE8), or [here](https://www.youtube.com/watch?v=4lO0iZDzzXk) for the *Game of Life*
inside the *Game of Life*, inside the *Game of Life*! In more specific terms, it is a simple game that produces emergent behaviour.

So, what are these simple rules?

1. Underpopulation: Any live cell with fewer than two live neighbours dies.
2. Survival: Any live cell with two or three live neighbours lives on to the next generation.
3. Overpopulation: Any live cell with more than three live neighbours dies.
4. Reproduction: Any dead cell with exactly three live neighbours becomes a live cell.

<div class="gol-rule-3x3" aria-label="Conway rules (3x3 illustrations)" 
    style="
      --gol-live: var(--body-font-color);
      --gol-dead: var(--body-background);
      --cell-stroke:var(--gray-200,#adb5bd);
      margin:1rem 0;">
  <style>
    .gol-rule-3x3{
      display:grid;
      grid-template-columns:repeat(2,minmax(20px,1fr));
      gap:1rem;
      align-items:start;
    }
    .gol-rule-3x3 figure{
      margin:0;
      font-size:0.95rem;
      color:var(--body-font-color);
      display:flex;
      flex-direction:column;
      align-items:center;
      text-align:center;
    }
    .gol-3x3-pair{
      display:flex;
      align-items:center;
      gap:.5rem;
      justify-content:center; /* center the two SVGs + arrow */
    }
    .gol-3x3-svg{
      width:84px;
      height:84px;
      background:transparent;
      border-radius:6px;
      display:block;
    }
    .gol-3x3-svg rect.cell{
      stroke:var(--cell-stroke);
      stroke-width:0.6;
      rx:2;
    }
    .arrow{
      font-weight:700;
      font-size:1.2rem;
      color:var(--body-font-color);
      padding:0 .5rem;
    }
    figcaption{ margin:0 0 .5rem 0; }
  </style>

  <!-- Rule 1: Underpopulation (center with 1 neighbour -> dies) -->
  <figure>
    <figcaption>1. Underpopulation (< 2 neighbours → dies)</figcaption>
    <div class="gol-3x3-pair" role="img" aria-label="Underpopulation 3x3 current to next">
      <!-- current 3x3 -->
      <svg class="gol-3x3-svg" viewBox="0 0 84 84" aria-hidden="true">
        <!-- 3x3 grid: cells 22x22 with 6px gap visual spacing handled by coords -->
        <rect x="6"  y="6"  width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="6"  width="22" height="22" class="cell" fill="var(--gol-live)"/> <!-- neighbour -->
        <rect x="62" y="6"  width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="6"  y="34" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="34" width="22" height="22" class="cell" fill="var(--gol-live)"/> <!-- center -->
        <rect x="62" y="34" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="6"  y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="62" y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
      </svg>
      <span class="arrow">→</span>
      <!-- next 3x3 -->
      <svg class="gol-3x3-svg" viewBox="0 0 84 84" aria-hidden="true">
        <rect x="6"  y="6"  width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="6"  width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="62" y="6"  width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="6"  y="34" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="34" width="22" height="22" class="cell" fill="var(--gol-dead)"/> <!-- center died -->
        <rect x="62" y="34" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="6"  y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="62" y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
      </svg>
    </div>
  </figure>

  <!-- Rule 2: Survival (2 or 3 neighbours -> stays alive) -->
  <figure>
    <figcaption>2. Survival (2 or 3 neighbours → stays alive)</figcaption>
    <div class="gol-3x3-pair" role="img" aria-label="Survival 3x3 current to next">
      <svg class="gol-3x3-svg" viewBox="0 0 84 84" aria-hidden="true">
        <rect x="6"  y="6"  width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="6"  width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="62" y="6"  width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="6"  y="34" width="22" height="22" class="cell" fill="var(--gol-live)"/> <!-- neighbour -->
        <rect x="34" y="34" width="22" height="22" class="cell" fill="var(--gol-live)"/> <!-- center -->
        <rect x="62" y="34" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="6"  y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="62" width="22" height="22" class="cell" fill="var(--gol-live)"/> <!-- neighbour -->
        <rect x="62" y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
      </svg>
      <span class="arrow">→</span>
      <svg class="gol-3x3-svg" viewBox="0 0 84 84" aria-hidden="true">
        <!-- same layout: center remains alive -->
        <rect x="6"  y="6"  width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="6"  width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="62" y="6"  width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="6"  y="34" width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="34" y="34" width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="62" y="34" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="6"  y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="62" width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="62" y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
      </svg>
    </div>
  </figure>

  <!-- Rule 3: Overpopulation (more than 3 neighbours -> dies) -->
  <figure>
    <figcaption>3. Overpopulation (> 3 neighbours → dies)</figcaption>
    <div class="gol-3x3-pair" role="img" aria-label="Overpopulation 3x3 current to next">
      <svg class="gol-3x3-svg" viewBox="0 0 84 84" aria-hidden="true">
        <rect x="6"  y="6"  width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="34" y="6"  width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="62" y="6"  width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="6"  y="34" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="34" width="22" height="22" class="cell" fill="var(--gol-live)"/> <!-- center -->
        <rect x="62" y="34" width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="6"  y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="62" y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
      </svg>
      <span class="arrow">→</span>
      <svg class="gol-3x3-svg" viewBox="0 0 84 84" aria-hidden="true">
        <!-- center dies -->
        <rect x="6"  y="6"  width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="34" y="6"  width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="62" y="6"  width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="6"  y="34" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="34" width="22" height="22" class="cell" fill="var(--gol-dead)"/> <!-- died -->
        <rect x="62" y="34" width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="6"  y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="62" y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
      </svg>
    </div>
  </figure>

  <!-- Rule 4: Reproduction (dead with exactly 3 neighbours -> becomes alive) -->
  <figure>
    <figcaption>4. Reproduction (dead with 3 neighbours → becomes alive)</figcaption>
    <div class="gol-3x3-pair" role="img" aria-label="Reproduction 3x3 current to next">
      <svg class="gol-3x3-svg" viewBox="0 0 84 84" aria-hidden="true">
        <rect x="6"  y="6"  width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="34" y="6"  width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="62" y="6"  width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="6"  y="34" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="34" width="22" height="22" class="cell" fill="var(--gol-dead)"/> <!-- center dead -->
        <rect x="62" y="34" width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="6"  y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="62" y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
      </svg>
      <span class="arrow">→</span>
      <svg class="gol-3x3-svg" viewBox="0 0 84 84" aria-hidden="true">
        <!-- center becomes alive -->
        <rect x="6"  y="6"  width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="34" y="6"  width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="62" y="6"  width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="6"  y="34" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="34" width="22" height="22" class="cell" fill="var(--gol-live)"/> <!-- born -->
        <rect x="62" y="34" width="22" height="22" class="cell" fill="var(--gol-live)"/>
        <rect x="6"  y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="34" y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
        <rect x="62" y="62" width="22" height="22" class="cell" fill="var(--gol-dead)"/>
      </svg>
    </div>
  </figure>
</div>

## Pseudocode
We write a simple script for the Game of Life logic. In particular, we define a function `step`, which at each step
iterates through all the cells in the domain, and based on the previous state, defines the status of the cells at the current step.
```pseudocode
# Assumes:
#  - cols, rows: grid dimensions
#  - grid: current Uint8Array of size cols*rows (1 = alive, 0 = dead)
#  - next: scratch Uint8Array same size
#  - idx(x,y): returns linear index, handling wrap-around (toroidal) indexing

function step():
  for y from 0 to rows - 1:
    for x from 0 to cols - 1:
      # count alive neighbours (8 surrounding cells)
      neighbours = 0
      neighbours += grid[idx(x-1, y-1)]
      neighbours += grid[idx(x,   y-1)]
      neighbours += grid[idx(x+1, y-1)]
      neighbours += grid[idx(x-1, y  )]
      neighbours += grid[idx(x+1, y  )]
      neighbours += grid[idx(x-1, y+1)]
      neighbours += grid[idx(x,   y+1)]
      neighbours += grid[idx(x+1, y+1)]

      i = idx(x, y)                      # current cell index

      # apply Conway's rules:
      #  - live cell with 2 or 3 neighbours → lives
      #  - live cell with <2 or >3 neighbours → dies
      #  - dead cell with exactly 3 neighbours → becomes alive
      if grid[i] == 1:
        if neighbours == 2 or neighbours == 3:
          next[i] = 1
        else:
          next[i] = 0
      else:
        if neighbours == 3:
          next[i] = 1
        else:
          next[i] = 0

  # swap buffers so "next" becomes the current state
  swap grid and next
```

## Implementation

Tada!

<div id="gameoflife" data-width="600" data-height="400" class="gol-wrap"
  style="--gol-live: var(--body-font-color); --gol-bg: var(--body-background);">
  <canvas class="gol-canvas"></canvas>

  <div class="gol-info">
    <div>Generation: <span id="gol-generation">0</span></div>
    <div>Population: <span id="gol-population">0</span></div>
    <div>Zoom: <span id="gol-zoom">10</span></div>
  </div>

  <div class="gol-controls">
    <button data-action="random">Initialise</button>
    <button data-action="toggle">Start</button>
    <button data-action="step">Step</button>
    <button data-action="clear">Clear</button>
    <button data-action="zoom-in">Zoom +</button>
    <button data-action="zoom-out">Zoom -</button>
  </div>
</div>

<style>
.gol-wrap { display:block; width:600px; max-width:100%; margin:0 auto; padding:8px; position:relative; }
.gol-canvas { display:block; image-rendering:pixelated; border:1px solid rgba(255,255,255,.1); }
.gol-info {
  position:absolute;
  top:0px;
  left:0px;
  background:var(--body-background);
  color:var(--body-text-color);
  padding:2px 2px;
  border-radius:5px;
  font-size: var(--body-font-size);
  text-align:left;
  pointer-events:none; /* so clicks pass through to the canvas */
}
.gol-controls button {
  padding: 6px 6px;                
  border-radius: 2px;               
  border: transparent;
  background-color: var(--body-background);
  color: var(--body-text-color);
  font-weight: 500;                 
  cursor: pointer;
  transition: background-color 0.2s, transform 0.1s;
}

.gol-controls button:hover {
  background-color: #e0e0e0;
}

.gol-controls button:active {
  transform: translateY(1px);     /* subtle press effect */
}
</style>

<script>
(() => {
  // Get references to canvas and controls
  const container = document.getElementById('gameoflife');
  const canvas = container.querySelector('.gol-canvas');
  const controls = container.querySelector('.gol-controls');

  // References to display elements
  const genDisplay = document.getElementById('gol-generation');
  const popDisplay = document.getElementById('gol-population');
  const zoomDisplay = document.getElementById('gol-zoom');

  // Canvas dimensions
  const width = parseInt(container.dataset.width) || 600;
  const height = parseInt(container.dataset.height) || 400;

  // Cell size and initial zoom display
  let cellSize = 10;
  zoomDisplay.textContent = cellSize;

  const ctx = canvas.getContext('2d');
  let rows = 0, cols = 0;
  let grid, next;

  // Simulation state
  let running = false;
  let raf = 0;
  let speed = 20;
  let generation = 0;

  // Linearise coordinates
  const idx = (x, y) => ((y + rows) % rows) * cols + ((x + cols) % cols);

  // Initialize grid and canvas dimensions
  function resize() {
    cols = Math.floor(width / cellSize);
    rows = Math.floor(height / cellSize);
    canvas.width = cols * cellSize;
    canvas.height = rows * cellSize;
    grid = new Uint8Array(cols * rows);
    next = new Uint8Array(cols * rows);
  }

  // Perform one step of the Game of Life
  function step() {
    let population = 0;
    for (let y = 0; y < rows; y++) {
      for (let x = 0; x < cols; x++) {
        // Count number of neighbours for each cell
        let n = 0; // Initialise number of neighbours to zero
        for (let dy = -1; dy <= 1; dy++) {
          for (let dx = -1; dx <= 1; dx++) {
            if (dx || dy) n += grid[idx(x + dx, y + dy)];
          }
        }
        // Get linear value of current index
        const i = idx(x, y);

        // Determine state of current cell based on number of neighbours and current status
        next[i] = grid[i] ? (n === 2 || n === 3) : (n === 3);
        
        // Increment population by one if current cell alive after step
        if (next[i]) population++;
      }
    }
    [grid, next] = [next, grid];
    // Increment generation after step
    generation++;
    
    // Update text content on canvas regarding population and generation
    genDisplay.textContent = generation;
    popDisplay.textContent = population;
  }

  // Draw the grid on canvas
  function draw() {
    // Get colours of background and live cells
    const bg = getComputedStyle(container).getPropertyValue('--gol-bg').trim() || '#08101a';
    const live = getComputedStyle(container).getPropertyValue('--gol-live').trim() || '#7fe7c8';

    // Fill entire canvas with background colour
    ctx.fillStyle = bg;
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    // Set fill style for live cells
    ctx.fillStyle = live;
    for (let y = 0; y < rows; y++) {
      for (let x = 0; x < cols; x++) {
        // If the cell is alive, draw a filled rectangle at position
        if (grid[idx(x, y)]) {
          ctx.fillRect(x * cellSize, y * cellSize, cellSize, cellSize)
          };
      }
    }
  }

  // Loop for animation
  function loop() {
    if (!running) return;
    step();
    draw();
    setTimeout(() => raf = requestAnimationFrame(loop), 1000 / speed);
  }

  // Fill grid with random cells
  function randomize() {
    for (let i = 0; i < grid.length; i++) grid[i] = Math.random() < 0.25 ? 1 : 0;
    generation = 0;
    genDisplay.textContent = 0;
    draw();
  }

  // Handle control button clicks
  controls.addEventListener('click', e => {
    const action = e.target.dataset.action;
    if (!action) return;

    if (action === 'toggle') {
      running = !running;
      e.target.textContent = running ? 'Pause' : 'Start';
      if (running) loop();
      else cancelAnimationFrame(raf);
    }

    if (action === 'step') { step(); draw(); }

    if (action === 'random') randomize();

    if (action === 'clear') {
      grid.fill(0);
      generation = 0;
      genDisplay.textContent = 0;
      popDisplay.textContent = 0;
      running = false;
      const toggleBtn = controls.querySelector('[data-action="toggle"]');
      if (toggleBtn) toggleBtn.textContent = 'Start';
      cancelAnimationFrame(raf);
      draw();
    }

    // Zoom in: also initialize the grid if empty
    if (action === 'zoom-in') {
      cellSize = Math.min(cellSize + 1, 50);
      zoomDisplay.textContent = cellSize;
      resize();
      if (!grid.some(v => v)) randomize();
      draw();
    }

    // Zoom out: also initialize the grid if empty
    if (action === 'zoom-out') {
      cellSize = Math.max(cellSize - 1, 2);
      zoomDisplay.textContent = cellSize;
      resize();
      if (!grid.some(v => v)) randomize();
      draw();
    }
  });

  // Toggle individual cells on canvas click
  canvas.addEventListener('click', ev => {
    const rect = canvas.getBoundingClientRect();
    const x = Math.floor((ev.clientX - rect.left) / cellSize);
    const y = Math.floor((ev.clientY - rect.top) / cellSize);
    grid[idx(x, y)] ^= 1;
    draw();
  });

  // Initialize canvas and grid
  resize();
  randomize();
  draw();
})();
</script>

{{< references >}}
