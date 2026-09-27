"""
Illustrates why both of these must work simultaneously during a rolling
rollout that spans the EXPAND step of expand-and-contract.
"""

# v1: doesn't know about full_name yet
def get_display_name_v1(user_row):
    return f"{user_row['first_name']} {user_row['last_name']}"

# v2: writes both, so v1 instances (still reading first/last_name)
# keep working throughout the rollout
def save_user_v2(user_row, first_name, last_name):
    user_row['first_name'] = first_name
    user_row['last_name'] = last_name
    user_row['full_name'] = f"{first_name} {last_name}"
    return user_row
