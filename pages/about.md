---
layout: page
title: about
description: Akhil Rao is an Assistant Professor of Economics at Middlebury College; research in environmental and natural resource economics
---

### who are you?

<table style="width:100%">
<div class="row">
  <div class="column">
    <td width="75%" class = "left"> 
        <p>  I am an Assistant Professor of Economics at Middlebury College, working mostly on outer space-related issues.<br/><br/> I received a BS in Business Administration in 2012 from the University of California, Riverside, an MA in Economics in 2016 from the University of Colorado Boulder, and a PhD in Economics in 2019 from the University of Colorado Boulder; my PhD adviser was <a href="http://spot.colorado.edu/~daka9342/">Dan Kaffine</a>. Before graduate school, I worked on motion sensor data analysis for action sports.
        </p>
    </td> 
  </div> 
    <div class="column">
    <td width="25%" class = "right">
       <img src="../assets/pics/akhil_hat.png"
                    title="Akhil Rao"
      />
    </td>
  </div>
</div>
</table>

### what is your work about?

Pedagogically, I'm very interested in the use of games and experiential learning to teach mathematical and economic concepts.

My research is mostly about the environmental and industrial economics of outer space, with a second agenda about environmental disasters featuring strong biophysical couplings with economic activity (e.g. infectious disease, fires). There is usually a computational or dynamic flavor in my work. My research is motivated by a desire to see us make better use of limited resources and fragile environments.

#### the economics of outer space

Most of my research is on the economics of orbit use. Earth's orbits are the world's largest common-pool resource, and as humans launch more satellites the risk of collisions between orbiting objects increases. Paths in low-Earth orbit are under &ldquo;open access&rdquo;&mdash;firms are unable to secure property rights over orbits. Open access to a common-pool resource typically causes over-exploitation, and sometimes collapse, of the resource. In the orbital case, expect to see more satellite-destroying collisions and a higher risk of [Kessler Syndrome](https://en.wikipedia.org/wiki/Kessler_syndrome) in low-Earth orbit than would be socially optimal.

In my job market paper I derived economic principles governing the choice of space traffic control policies and the effects of active debris removal technologies. Since physical uncertainty over collisions is symmetric between regulators and firms, space traffic control policies can be efficient as prices or quantities. What matters for efficiency is whether policies are imposed on the stock of active satellites in an orbit (e.g. a satellite tax) or the flow of satellites entering an orbit (e.g. a launch tax). Policies targeting satellite launches deter entry into the orbital commons, creating rents for incumbent satellite owners. These rents cause inefficient spikes in the launch rate, collision risk, and risk of Kessler Syndrome, and limit the regulator's ability to induce socially but not privately optimal satellite deorbits. Policies targeting satellite ownership, on the other hand, can smoothly reduce the collision risk and induce deorbits when necessary. Though active debris removal technologies can reduce the risk of Kessler Syndrome, under open access they will only reduce the risk of satellite-destroying collisions to the extent that satellite owners bear the cost of debris removal.

In ongoing work, I'm looking into how megaconstellation owners will interact and how they should be regulated; designing integrated assessment models of orbit use which combine structural econometric methods and tractable physics models of orbital mechanics; using network theory and econometrics to develop granular models of risk-mitigating maneuvering patterns in orbit; and the structure of self-enforcing international agreements to manage collision risk and debris production. These projects involve a mix of economic theory and statistics. Calibrating/estimating the models requires substantial new data collection and integration.

While I focus on commercial orbit use, national security space use is an important piece of the story. Historically, the most accurate space situational awareness data has been provided by the US military as a global public good, and the US national security establishment has been one of the largest space users globally. This is changing now as commercial use takes off and other nations are also starting to demonstrate [anti-satellite weapons](https://en.wikipedia.org/wiki/Anti-satellite_weapon) capabilities. The latter is particularly dangerous for orbit management, as a kinetic conflict in space could trigger Kessler Syndrome in valuable orbits. It's still unclear to me how effective orbit management policy should account for this.

#### the economics of infectious diseases

COVID-19 has really highlighted how vulnerable modern economies are to novel pathogens. I'm most interested in two classes of questions here: what kinds of externalities do different diseases induce, and what can policies do to manage both disease spread and economic outcomes.

Different diseases induce different kinds of externalities due to their different biologies. COVID-19 imposes a strong externality between infected and susceptible individuals, but the short incubation period means the intertemporal externality within individuals (the "[internality](https://en.wikipedia.org/wiki/Internality)") is less stark (though given how little we know about the long-term consequences of contracting COVID, maybe it's stronger than we think). A disease like HIV-AIDS, on the other hand, has flavors of both kinds of externality: individuals don't account for each others' safety, and the long delay between infection and consequence means individuals may not sufficiently account for future costs. Understanding how disease biology creates different externalities is important for disease management, as it tells us how individuals will trade off risks and costs to themselves and others.

Ultimately, infectious disease management is both an epidemiological and an economic problem. Again, COVID-19 offers useful examples: efforts taken to mitigate the spread of the disease come with different economic costs, e.g. lockdowns greatly suppress economic activity and disease spread while mask mandates do less of each. It's not always obvious whether some measures are strictly dominated by others in their effectiveness on both dimensions, or how to trade off effectiveness along different dimensions. In my work I try to characterize both the economic and epidemiological effectiveness of different interventions, with a goal of identifying efficient interventions (maximal disease control for minimal economic cost).

There are interesting connections between modeling infectious diseases and other economic processes, such as labor markets. Just as the contact function for a disease's spread couples human behavior and the aggregate disease state, the matching function for new job formation couples job searchers and firms posting vacancies. Contacts between susceptible and infected individuals produce new infected individuals; matches between job searchers and firms with vacancies produce new jobs. In both cases, the output of the process depends on individual choices, population levels, and the "technology" which converts interactions into output. Whereas matching functions in labor markets typically involve entirely human-created technologies like job boards, the technologies in contact functions are both biological (e.g. virus characteristics) and artificial (e.g. institutions which mediate contacts). 

Most of the really interesting epi-econ interactions happen away from steady states. I find this a fun modeling constraint, since it limits the usefulness of the perturbation-based methods used widely in economic dynamics. Infectious diseases also induce time-dependent heterogeneity in populations, which I find fascinating from a social choice perspective.

#### computational economics

I'm also interested in computational modeling and assessing the economic policy consequences of computational tools and limitations. 

My work in computational modeling has mostly been about ways to speed up dynamic programming algorithms and simulating large congestion games with heterogeneous agents. On the former, I'm interested in applying flexible statistical methods, like neural networks and penalized regressions, to represent high-dimensional state spaces and avoid the curse of dimensionality. On the latter, agent-based simulations are particularly interesting to me because their computational limitations often suggest issues which real humans and organizations need to work around.

My work on the economic policy consequences of computation has been focused on applying tools from [information elicitation](https://sites.google.com/site/informationelicitation/) to externality problems in environmental economics. Many externality problems require a regulator to elicit reports from parties generating externalities to assess compliance and liability. Using these reports as the basis of corrective policy gives externality creators an incentive to manipulate their reports to reduce their liability. In ongoing work, my coauthor and I uncover some features of economically-efficient elicitation and corrective taxation mechanisms which use independently-obtained aggregate or ambient data to verify marginal emissions reports from polluters. We numerically analyze a specific scheme, the Brier-Pigou tax, and consider its robustness to strategic collusion in reporting. I think it would be useful for policy design if this could be generalized to an understanding of how the [elicitation complexity](https://arxiv.org/abs/1506.07212) of marginal damages or abatements scales with uncertainty and convexity in the damage or abatement cost functions. Ultimately, every regulator must query some information and perform some calculations to do their job. Their ability to do so has economic implications for the systems they query and regulate. This agenda connects to broader questions about the policy design implications of information requirements and bounded computational abilities.

<!-- 
#### the economics of scientific investments

The broad question I'm considering is, "How should society prioritize resources among investments in scientific progress?"  While cost-benefit analysis is the guiding principle, there are significant challenges in calculating the benefits of scientific investments, many of which involve fundamental limits of human knowledge and significant lags in realizing benefits. It is difficult to assign probabilities to outcomes we can't conceive of, and it may take many decades before we realize the value of a contribution. I often think of the Fourier transform in this context: [though it was known since at least around 1823, it wasn't until 1930 that Norbert Wiener demonstrated the broad utility of the equation](https://pulse.embs.org/january-2016/highlights-in-the-history-of-the-fourier-transform/). In this context, I wonder under what assumptions cost-benefit analyses of supporting the mathematicians developing these tools would have declared their work beneficial enough to publicly support.

Currently I'm thinking about the economics of investments in particle colliders for high-energy physics. One of the central aims of particle physics is to understand the elementary building blocks of nature. The consensus in the particle physics community seems to be that larger particle colliders are necessary to select between different high-energy theories.

While the costs of collider investments are often relatively easy to measure, their benefits are varied and relatively difficult to measure. They span direct and indirect benefits received by regional economies, including scientific workforces and those who would employ them later, benefits conferred from spinoff technologies (some which are predictable and some which are less so), national security benefits of maintaining a buffer of skilled scientists and engineers, and the direct scientific benefits of the work itself. My goal here as an economist is to frame the ongoing debate about collider investments in the US in rigorous economic terms, provide best practices for conducting cost-benefit analyses for new collider investments around the world, and develop policy guidelines to maximize the net benefits of such investments. -->


### what is your play about?

In my free time I make [silly Twitter bots](https://twitter.com/bakRabot), play video games (online RTS and single-player RPGs), and think about the economics of fictional worlds. I like bike rides, snowboarding, sci-fi/fantasy and historical fiction, tea, rock climbing, and judo. I live with a cat who thinks I'm kind of slow.

---

<div class="container">
<h4><a name="contact"></a>contact</h4>

    <div class="row-fluid">
        <div class="span5">
            <a href="http://www.middlebury.edu/academics/econ/faculty_staff_officehours/node/623754">Akhil Rao</a><br/>
            <a href="http://www.middlebury.edu/academics/econ">Department of Economics</a><br/>
            <a href="https://www.middlebury.edu">Middlebury College</a><br/>
            Warner Hall 502A<br/>
            Middlebury, VT 05753<br/>
            USA<br/><br/>

            <div id="hide_email">
            Email: <code>akh</code><b>I</b><code>ilr</code><b>don't</b><code>@</code><b>want</b><code>midd</code><b>spam!
            </b><code>le</code><b>So</b><code></code><b>please</b><code>bu</code><b>leave
            </b><code>ry</code><b>me</b><code>.</code><b>alone</b><code>e</code><b>!</b><code>du</code><br/>
            Phone: 802-443-2192
            </div>
        </div>

    </div>
</div>
