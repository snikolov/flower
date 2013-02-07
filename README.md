# Overview
This Processing script takes a random walk through the canvas, and at each point, draws a "flower" --- a randomly generated object that looks kind of like a crumpled piece of paper or... a flower! The resulting flower bouquet is saved to a file that records the relevant parameters used to generate it. These bouquets are generated and saved one after another, with different random seeds, until the program is stopped.

#How to explore the space of bouquets
The script is set up to generate bouquets indefinitely until you tell it to stop. Each bouquet has randomly chosen random seeds, whose values are recorded in the file name where the bouquet was saved. The random seeds will determine 1) the shape of each flower 2) the "shape" of the random walk taken to determine the positions of the flowers. Once you decide you like how the random aspects turned out, you can fix the random seeds to the recorded values and tune the deterministic aspects. One such deterministic aspect is the length scale of the random walk (randTranslate). The random seed only determines the "shape" of the random walk, while the length scale determines the ultimate size. For example, you like the shapes of the flowers and the shape of the random walk, but the flowers are too far apart. You can reduce randTranslate to bring them closer together. 

#Important caveat
Currently, the shapes of the flowers are tied to the resolution (for example, they will look more pointy if the resolution is larger).
