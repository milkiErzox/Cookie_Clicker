/*
  Warnings:

  - You are about to drop the `Equipement` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Joueur` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Equipement";

-- DropTable
DROP TABLE "Joueur";

-- CreateTable
CREATE TABLE "User" (
    "id" UUID NOT NULL,
    "cookie" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "cookiePerS" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "rebirth" INTEGER NOT NULL DEFAULT 0,
    "rebirthPoint" INTEGER NOT NULL DEFAULT 0,
    "lastUpdate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Skills" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "skillsIdPrerequis" INTEGER,

    CONSTRAINT "Skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserSkill" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "skillId" INTEGER NOT NULL,
    "unlocked" BOOLEAN NOT NULL,

    CONSTRAINT "UserSkill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Upgrade" (
    "id" SERIAL NOT NULL,
    "nom" TEXT NOT NULL,
    "prix" DOUBLE PRECISION NOT NULL,
    "effet" TEXT NOT NULL,

    CONSTRAINT "Upgrade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserUpgrade" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "ameliorationId" INTEGER NOT NULL,
    "debloquer" BOOLEAN NOT NULL,

    CONSTRAINT "UserUpgrade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Equipment" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "prix" DOUBLE PRECISION NOT NULL,
    "effet" TEXT NOT NULL,

    CONSTRAINT "Equipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserEquipment" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "equipmentId" INTEGER NOT NULL,
    "unlocked" BOOLEAN NOT NULL,

    CONSTRAINT "UserEquipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rebirth" (
    "id" SERIAL NOT NULL,
    "niveau" INTEGER NOT NULL,
    "prerequis" INTEGER NOT NULL,
    "recompense" TEXT NOT NULL,

    CONSTRAINT "Rebirth_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "UserSkill" ADD CONSTRAINT "UserSkill_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserSkill" ADD CONSTRAINT "UserSkill_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skills"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserUpgrade" ADD CONSTRAINT "UserUpgrade_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserUpgrade" ADD CONSTRAINT "UserUpgrade_ameliorationId_fkey" FOREIGN KEY ("ameliorationId") REFERENCES "Upgrade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserEquipment" ADD CONSTRAINT "UserEquipment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserEquipment" ADD CONSTRAINT "UserEquipment_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES "Equipment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
