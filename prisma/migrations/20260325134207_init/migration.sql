-- CreateTable
CREATE TABLE "Joueur" (
    "id" TEXT NOT NULL,
    "nom" TEXT NOT NULL,
    "puissance" INTEGER NOT NULL,
    "joueurId" TEXT NOT NULL,

    CONSTRAINT "Joueur_pkey" PRIMARY KEY ("id")
);
