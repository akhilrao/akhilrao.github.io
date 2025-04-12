---
layout: frontpage
title: Where are active satellites located?
---

{% assign current_id = "apo_peri_overlay" %}
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

![Apogee and Perigee of Orbiting Satellites (2016)](../../assets/bigpublpics/apo_peri_overlay.png)

**Where are active satellites located?** &mdash; The picture shows the distributions of [apogee and perigee](https://en.wikipedia.org/wiki/Apsis) for man-made satellites orbiting the Earth, calculated using [data from the Union of Concerned Scientists](https://www.ucsusa.org/nuclear-weapons/space-weapons/satellite-database).
*Upper left:* Distribution of perigee for all satellites. 
*Upper right:* Distribution of apogee for all satellites.
*Lower left:* Distribution of perigee (gray bars with blue lining) and apogee (gray bars with red lining) for satellites in [low-Earth orbit](https://en.wikipedia.org/wiki/Low_Earth_orbit).
*Lower right:* Distribution of perigee (gray bars with blue lining) and apogee (gray bars with red lining) for satellites in [geostationary orbit](https://en.wikipedia.org/wiki/Geostationary_orbit).

Earth's orbits are easily the largest physical commons humanity has ever used. But some orbits are more useful than others, leading to clustering. Space: the lonesome crowded frontier.