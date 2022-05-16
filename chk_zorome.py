import sys
args = sys.argv[1]

for numbers in args.split(','):

    if len(numbers) == 3 and numbers.isdigit():
        num_ng = 0

        for num in numbers:
#            print(numbers[0])
            if numbers[0] != num:
                num_ng = 1
                break

        if num_ng == 0:
            print('zorome: ' + numbers)
#            pass

        elif num_ng == 1:
            print(numbers)
#            pass
    else:
        print('unmach pattern: ' + numbers)
