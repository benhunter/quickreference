import argparse

def accuracy(file_name):
    # code to calculate accuracy
    print("Accuracy: ", 0.95)
    print("Model file: ", file_name)

def train(file_name):
    # code to train model
    print("Training...")
    print("Model file: ", file_name)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("command", choices=["train", "accuracy"], help="run 'train' or 'accuracy'")
    parser.add_argument("-l", "--load", help="load model from file", type=str)
    args = parser.parse_args()

    if args.command == "accuracy":
        if args.load is None:
            parser.error("the 'accuracy' command requires the '--load' option")
        accuracy(args.load)
    elif args.command == "train":
        train(args.load)

if __name__ == "__main__":
    main()
