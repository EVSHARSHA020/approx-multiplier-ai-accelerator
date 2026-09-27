import csv

exact_vals = []
trunc_vals = []
mitch_vals = []

with open("results.csv", "r") as f:
    reader = csv.DictReader(f)
    for row in reader:
        exact_vals.append(int(row["exact"]))
        trunc_vals.append(int(row["truncated"]))
        mitch_vals.append(int(row["mitchell"]))

def compute_metrics(exact, approx, name):
    n = len(exact)
    error_distances = []
    relative_errors = []

    for e, a in zip(exact, approx):
        ed = abs(e - a)
        error_distances.append(ed)
        if e != 0:
            relative_errors.append(ed / e)
        # skip relative error calc when exact=0 to avoid divide-by-zero

    med = sum(error_distances) / n
    mred = sum(relative_errors) / len(relative_errors) * 100
    max_ed = max(error_distances)
    max_re = max(relative_errors) * 100

    print(f"--- {name} ---")
    print(f"Mean Error Distance (MED):        {med:.2f}")
    print(f"Mean Relative Error Distance:      {mred:.2f}%")
    print(f"Max Error Distance:                {max_ed}")
    print(f"Max Relative Error:                {max_re:.2f}%")
    print()

print(f"Total test cases: {len(exact_vals)}\n")
compute_metrics(exact_vals, trunc_vals, "Truncated Multiplier (P2)")
compute_metrics(exact_vals, mitch_vals, "Mitchell Multiplier (P3)")