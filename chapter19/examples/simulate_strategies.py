"""
Toy simulator: for each strategy, what fraction of requests hit the
*broken* v2 over time, assuming v2 is broken and nobody intervenes for
10 ticks. Illustrates blast-radius shape, not real infra behavior.
"""

def recreate(ticks=10):
    return [1.0 if t >= 1 else 0.0 for t in range(ticks)]  # instant 100% after cutover

def rolling(ticks=10, instances=4):
    return [min(1.0, t / instances) for t in range(ticks)]

def blue_green(ticks=10, flip_at=1):
    return [1.0 if t >= flip_at else 0.0 for t in range(ticks)]

def canary(ticks=10, initial=0.05, ramp=0.15):
    frac = initial
    out = []
    for t in range(ticks):
        out.append(min(1.0, frac))
        frac += ramp
    return out

if __name__ == "__main__":
    strategies = {
        "recreate": recreate(),
        "rolling": rolling(),
        "blue_green": blue_green(),
        "canary": canary(),
    }
    print(f"{'tick':>4} " + " ".join(f"{k:>12}" for k in strategies))
    for t in range(10):
        row = " ".join(f"{strategies[k][t]*100:11.0f}%" for k in strategies)
        print(f"{t:>4} {row}")
