# Kleros: The Oracle for Prediction Markets

A technical brief on Kleros as the resolution layer for prediction markets.
This is the markdown version of the interactive brief at
https://oracle.kleros.io/.

## 1. The resolution layer

**The oracle for prediction markets.** A prediction market is only as
trustworthy as the layer that resolves it. When two sides disagree on an
outcome, Kleros settles it through a neutral, transparent due process that
scales alongside the platform.

- **Scalability** — A randomly drawn jury per case, from a subcourt suited to
  the topic. With 750+ jurors already staked, capacity is not a constraint.
- **Due process** — Structured evidence, reasoned votes, and appeals that
  double the jury each round.
- **Credible neutrality** — Contested outcomes decided by an independent,
  randomly selected jury.

## 2. Proof, before the pitch

**Live since 2018. Not a whitepaper.**

- **2018** — Running a live, on-chain arbitration system since.
- **2020** — Resolving prediction-market disputes. Omen (now Presagio) was
  first to integrate.
- **2,653** — Disputes resolved on-chain across Ethereum, Gnosis & Arbitrum.
- **+750** — Jurors participating in Kleros arbitration.

With Reality.eth: five years of contested outcomes, settled by jury.

## 3. How it works

**One question. A two-layer resolution.**

Reality.eth, the optimistic layer:

1. **Question posted** — with a bond, naming Kleros as the arbitrator.
2. **Bond escalation** — anyone answers or challenges by doubling the bond.
   A wrong bond is forfeited. Most questions settle right here; no court
   needed.

On genuine disagreement, anyone pays a fee to escalate to Kleros Court, the
arbitration layer:

3. **Sortition: jurors drawn** — randomly, weighted by staked PNK, from the
   relevant subcourt.
4. **Vote: evidence & ruling** — jurors vote independently. Coherent votes are
   rewarded; incoherent ones slashed.
5. **Settle: back to the market** — the ruling flows back to Reality.eth and
   settles the market.
6. **The appeal escalator** — jurors per round: 3 → 7 → 15 → 31 → … Each
   appeal doubles the jury, so overturning a well-evidenced answer becomes
   progressively more expensive.

Jurors cannot be chosen, and they cannot choose their case. More PNK raises
your probability of being drawn, but it never buys the seat.

## 4. Why not UMA

**Same game. Different table.** Both reward voters for converging on the
answer the panel is expected to choose, a Schelling point. The difference is
who sits on the panel.

|  | UMA | Kleros |
|---|---|---|
| Who answers | The entire token-holder base votes on every dispute. | A fixed-size jury, drawn per case from a topic-relevant subcourt. |
| Who decides | Token-weighted vote of holders. | A random, stake-weighted jury draw, per case. |
| Scalability | Everyone votes on everything. As volume climbs, voters can't study each case. | Each case gets a dedicated jury drawn from 750+ active jurors, so review depth holds as volume grows. |
| Due process | No appeal; escalation to the DVM, where ~9 wallets hold 50% of voting power. | Evidence + appeals. The jury doubles each round, raising the cost to overturn a coherent answer. |
| Speed | ~2 days. | Most cases resolve in a day; heavily appealed cases can take a couple of weeks. |

## 5. On real money

**Four disputes, settled by a drawn jury.** Every ruling is a live, on-chain
link.

- **[Case #532 · Omen/Presagio](https://klerosboard.com/1/cases/532)** — "Will
  Joe Biden win the 2020 US presidential election?" General Court, 500 votes.
  Ruled Yes.
- **[Case #302 · Omen/Presagio](https://klerosboard.com/1/cases/302)** —
  "≥1,000 reported US COVID deaths in a single day, first half of July 2020?"
  General Court, 500 votes. Ruled Yes.
- **[Case #1661 · Seer](https://klerosboard.com/100/cases/1661)** — "Was
  Zelenskyy photographed or videotaped wearing a suit between May 22 and
  June 30, 2025?" General Court, 31 votes. Ruled Yes.
- **[Case #1657 · Seer](https://klerosboard.com/100/cases/1657)** — "Winner of
  the run-off in the 2024 Romanian presidential election?" General Court,
  31 votes. Resolved too soon, run-off annulled.

The hard cases, including the one where the right call was that the market
resolved too soon.

## 6. When oracles fail

**Not every contested outcome is an oracle failure.** Some contested
Polymarket outcomes trace to the market's own rules or a late clarification,
not the oracle. But the oracle layer can be a structural weak point in its own
right.

> On UMA, voting power is concentrated in a handful of large holders, and a
> majority of active voters are linkable to Polymarket trading accounts, a
> direct positional conflict in several markets.

Under Kleros: 25% of stake is a 25% chance of being drawn as a juror, not 25%
of the verdict. And every appeal raises the cost of holding a dishonest
result, making concentration expensive rather than decisive.

## 7. Who's already in

**Prediction markets resolving with Kleros:**

- **Seer** — Decentralization, composability, and community-driven resolution.
- **Omen / Presagio** — Built on Gnosis' Conditional Tokens Framework. First
  to integrate, 2020.
- **Foresight** — Kleros's own forecasting experiment, running on Seer.
- **Precog** — Collective intelligence for human and AI participants.
- **Futarchy.fi** — Prediction markets & conditional tokens for DAO
  decision-making.
- **Deep Funding** — Allocation proposals run through conditional prediction
  markets.
- **Ringo** — Open markets on real-world events, integrated with X.

## 8. Integrate

**Make Kleros your resolution layer.** Plug Reality.eth and Kleros into your
market in a few steps. Optimistic by default, with a credible court behind the
hard cases.

- [Oracle product docs](https://docs.kleros.io/products/oracle)
- [Integration guide](https://docs.kleros.io/integrations/types-of-integrations/3.-kleros-oracle-integration)

Available on Ethereum, Arbitrum, Gnosis, Polygon, Base, Optimism, Unichain.
Solana integration in progress.

Contact: juanrah@kleros.io · https://t.me/juanrah

[Vitalik's take on Kleros](https://justusekleros.netlify.app/)
