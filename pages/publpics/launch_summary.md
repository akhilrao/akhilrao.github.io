---
layout: frontpage
title: Historical trends in satellite launch and use
---

{% assign current_id = "launch_summary" %}
{% assign current_viz = site.data.visualizations.visualizations | where: "id", current_id | first %}

<div class="navbar">
  <div class="navbar-inner">
      <ul class="nav">
          {% if current_viz.prev %}
          {% assign prev_viz = site.data.visualizations.visualizations | where: "id", current_viz.prev | first %}
          <li><a href="{{ current_viz.prev }}.html">← prev</a></li>
          {% endif %}
          <li><a href="../../pages/visualizations.html">all visualizations</a></li>
          {% if current_viz.next %}
          {% assign next_viz = site.data.visualizations.visualizations | where: "id", current_viz.next | first %}
          <li><a href="{{ current_viz.next }}.html">next →</a></li>
          {% endif %}
      </ul>
  </div>
</div>

![Growth in yearly satellite launches and the number of satellite operators, 1990-2015](../../assets/bigpublpics/launch_summary.png)

**How have satellite launches and use been trending?**. &mdash; Since 1990, the number of satellites launched per year has increased dramatically. For most of this period, this growth was accompanied by growth in the number of different satellite operators. Most operators owned a handful of satellites, mostly in the geosynchronous belt. the late 1990s marked the rise of Iridium, the first large low-Earth orbit constellation. Part of the New Space era is the rise of new mega-constellations in low-Earth orbit. I used [data from the Union of Concerned Scientists](https://www.ucsusa.org/nuclear-weapons/space-weapons/satellite-database) to generate these plots.
