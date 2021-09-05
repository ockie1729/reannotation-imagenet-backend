#!/usr/bin/env python3
# coding: utf-8
import argparse
import os


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--img_rootd", type=str, required=True)
    parser.add_argument("--out", type=str, required=True)
    args = parser.parse_args()

    fnames_dict = {}

    class_names = os.listdir(args.img_rootd)
    for class_name in class_names:
        fnames = os.listdir(os.path.join(args.img_rootd, class_name))
        fnames_dict[class_name] = fnames

    with open(args.out, mode="w") as f:
        for class_name in fnames_dict.keys():
            for fname in fnames_dict[class_name]:
                url = 'http://xpaperchallenge.org/tmp/{0}/{1}'. \
                      format(class_name, fname)
                f.write('{0},{1}\n'.format(class_name,
                                           url))


if __name__ == "__main__":
    main()
