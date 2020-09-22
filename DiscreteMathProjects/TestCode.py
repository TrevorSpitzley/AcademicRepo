print("Hello World!")
print("I have finally got around to starting on Python!")

cars = ["Ferarri", "Bugatti", "McClaren", "Lamborghini", "Aston Martin", "Audi"]
five = 5
name = "Trevor Spitzley"

# Print off names
for car in cars:
    print(car)

# Print last name
if five <= 6:
    print(name[five + 2: len(name)])

# Mini function to calculate average


def calc_average(nums):
    avg = 0
    for x in nums:
        avg += x
    return avg / len(nums)


numbers = [23, 45, 78, 33, 1, 20, 99, 29873, -283]

print(calc_average(numbers))



