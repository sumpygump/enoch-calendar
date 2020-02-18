all: enoch-all.txt enoch-ad.txt enoch-uniform.txt enoch-ny.txt

enoch-all.txt:
	@echo "Generating dates for all days from -4004 to 3276"
	ENOCH_DAILY=1 php enoch-cal > enoch-all.txt

enoch-ad.txt:
	@echo "Generating dates for anno domini from 0000 to 3276"
	ENOCH_DAILY=1 ENOCH_DAYS=1196531 ENOCH_EPOCH=0000-03-26 php enoch-cal > enoch-ad.txt

enoch-uniform.txt:
	@echo "Generating dates for uniform enoch calendar (no jubilees) for all days"
	ENOCH_DAILY=1 ENOCH_UNIFORM=1 ENOCH_EPOCH=-4021-02-04 php enoch-cal > enoch-uniform.txt

enoch-ny.txt:
	@echo "Generating dates for new years only"
	ENOCH_DAILY=0 php enoch-cal > enoch-ny.txt

clean:
	rm -vf enoch-all.txt enoch-ad.txt enoch-uniform.txt enoch-ny.txt
